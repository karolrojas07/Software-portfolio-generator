# syntax=docker/dockerfile:1

# Elixir 1.15 builder (use official Elixir image tag)
ARG ELIXIR_VERSION=1.15.7
FROM elixir:${ELIXIR_VERSION} AS builder

# Install Node.js for esbuild and Tailwind CSS and required tooling
ARG NODE_VERSION=20
# Install `inotify-tools` so `:file_system` can find `inotifywait` during build
RUN apt-get update -qq && apt-get install -y -qq curl inotify-tools && \
    curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get install -y -qq nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Build environment
ENV MIX_ENV=prod
ENV NODE_ENV=production

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

# Install dependencies (prod only)
RUN mix deps.get --only prod
RUN mix deps.compile

# Compile application (generates colocated JS used by assets)
RUN mix compile

# Compile assets (after compile so colocated JS exists)
RUN mix assets.deploy

# Build release
RUN mix release

# Final runtime image
FROM debian:bookworm

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
