# Software Portfolio Generator

A dynamic portfolio website generator built with Phoenix and LiveView. Create professional, customizable portfolio pages showcasing your work experience, certifications, projects, and technical skills.

## Features

- **Single-Profile Portfolio Pages** — Generate beautiful portfolio websites from structured data
- **Dynamic Content** — Display work experience, certifications, projects, technologies, languages, and social links
- **Interactive UI** — Built with Phoenix LiveView for real-time interactivity without page reloads
- **Responsive Design** — Mobile-friendly layouts powered by Tailwind CSS v4
- **Dark/Light Theme** — Automatic theme switching with localStorage persistence
- **Technology Filtering** — Interactive filtering of work experience by technologies used
- **Customizable Styling** — daisyUI-based theming with custom OKLCH color palettes

## Quick Start

### Prerequisites

- Elixir 1.14+
- Phoenix 1.8+
- PostgreSQL 12+

### Setup

1. **Clone and install dependencies:**
   ```bash
   git clone https://github.com/karolrojas07/Software-portfolio-generator.git
   cd Software-portfolio-generator
   mix setup
   ```

2. **Configure environment:**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration (especially DEFAULT_PROFILE_ID)
   ```

3. **Seed the database:**
   ```bash
   mix run priv/repo/seeds.exs
   ```

4. **Start the development server:**
   ```bash
   mix phx.server
   ```

   Visit [`localhost:4000`](http://localhost:4000) in your browser.

## Available Commands

```bash
# Development
mix phx.server              # Start dev server
iex -S mix phx.server       # Start with interactive console

# Database
mix ecto.migrate            # Run migrations
mix ecto.reset              # Drop, recreate, and seed database

# Testing & Quality
mix test                    # Run all tests
mix precommit               # Compile + format + check for unused deps + test

# Assets
mix assets.build            # Build Tailwind CSS and esbuild
```

## Project Structure

### Domain Layer
`lib/software_portfolio_generator/` — Business logic and data models:
- **profiles** — Main aggregate that orchestrates all portfolio data
- **jobs**, **certifications**, **projects** — Context modules for domain entities
- **social_networks**, **languages** — Supporting contexts for profile enrichment

### Web Layer
`lib/software_portfolio_generator_web/` — Phoenix views and components:
- **live/profile_live.ex** — Main LiveView that renders the portfolio page
- **components/profile/** — Reusable section components:
  - Personal information, certifications, social networks
  - Work experience (with technology filtering)
  - Projects and skills display

### Frontend
`assets/` — Tailwind CSS, daisyUI themes, and esbuild JavaScript bundling

## Environment Configuration

The following environment variables control the application:

- `DEFAULT_PROFILE_ID` — The profile ID to display (defaults to `1`)
- `DATABASE_URL` — PostgreSQL connection string
- Other Phoenix configuration variables

See `.env.example` for all available options.

## How to Contribute

We welcome contributions! Follow these steps to contribute:

### 1. Fork and Clone
```bash
git clone https://github.com/YOUR_USERNAME/Software-portfolio-generator.git
cd Software-portfolio-generator
```

### 2. Create a Feature Branch
```bash
git checkout -b feature/your-feature-name
```

### 3. Install Dependencies
```bash
mix setup
```

### 4. Make Your Changes
- Follow the existing code style and patterns
- Keep changes focused and atomic
- Update documentation if needed

### 5. Test Your Changes
```bash
mix precommit  # Runs compile, format, unused deps check, and tests
```

### 6. Commit and Push
```bash
git commit -m "feat: add your feature description"
git push origin feature/your-feature-name
```

### 7. Open a Pull Request
Create a PR against the main branch with:
- Clear description of the changes
- Reference to related issues if applicable
- Screenshots for UI changes

### Development Guidelines

- **Code Style** — Run `mix format` to auto-format code
- **Testing** — Add tests for new features: `mix test`
- **Database** — Use migrations for schema changes
- **Components** — Use stateless components when possible, store state only when necessary
- **LiveView Events** — Handle interactions in `handle_event/3`

## Tech Stack

- **Backend** — Elixir, Phoenix 1.8, LiveView 1.1, Ecto ORM
- **Database** — PostgreSQL
- **Frontend** — Tailwind CSS v4, daisyUI, esbuild
- **Styling** — OKLCH color system with custom light/dark themes

## Learn More

- [Phoenix Framework](https://www.phoenixframework.org/)
- [Phoenix Documentation](https://hexdocs.pm/phoenix)
- [LiveView Guide](https://hexdocs.pm/phoenix_live_view)
- [Tailwind CSS](https://tailwindcss.com/)
- [daisyUI](https://daisyui.com/)

## License

This project is open source and available under the MIT License.

## Support

For questions or issues:
- 📋 [Create an issue](https://github.com/karolrojas07/Software-portfolio-generator/issues)
- 💬 [Start a discussion](https://github.com/karolrojas07/Software-portfolio-generator/discussions)
