# syntax=docker/dockerfile:1

# Elixir 1.15 builder
ARG ELIXIR_VERSION=1.15.7
ARG OTP_VERSION=26.2.1
ARG DEBIAN_VERSION=bookworm

FROM hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION} AS builder

# Install Node.js for esbuild and Tailwind CSS
ARG NODE_VERSION=20
RUN apt-get update -qq && apt-get install -y -qq curl && \
    curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get install -y -qq nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Hex and Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Copy source code
COPY mix.exs mix.lock ./
COPY config config
COPY lib lib
COPY priv priv
COPY assets assets
COPY rel rel

# Install dependencies
RUN mix deps.get --only prod

# Compile assets
RUN mix assets.deploy

# Compile application
RUN mix compile

# Build release
RUN mix release

# Final runtime image
FROM debian:${DEBIAN_VERSION}

# Install runtime dependencies
RUN apt-get update -qq && \
    apt-get install -y ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy release from builder
COPY --from=builder /app/_build/prod/rel/software_portfolio_generator ./

# Create non-root user
RUN useradd -m -u 1000 app && chown -R app:app /app
USER app

# Health check
HEALTHCHECK --interval=10s --timeout=5s --start-period=5s --retries=3 \
    CMD /app/bin/software_portfolio_generator eval "IO.puts('ok')"

EXPOSE 8080
CMD ["/app/bin/server"]
