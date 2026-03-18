# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Setup
mix setup               # Install deps, setup DB, build assets

# Development
mix phx.server          # Start dev server at localhost:4000
iex -S mix phx.server   # Start with interactive console

# Database
mix ecto.migrate        # Run migrations
mix ecto.reset          # Drop, recreate, and seed DB
mix run priv/repo/seeds.exs

# Testing
mix test                # Run all tests
mix test path/to/test_file.exs:42  # Run single test at line

# Quality checks (run before commits)
mix precommit           # compile --warnings-as-errors + format + unused deps + tests

# Assets
mix assets.build        # Build Tailwind CSS + esbuild JS
```

Copy `.env.example` to `.env` and fill in values before running locally.

## Architecture

**Phoenix 1.8 + LiveView 1.1** app backed by PostgreSQL. The app renders a single-profile portfolio page at `/`.

### Domain (business logic)

`lib/software_portfolio_generator/` contains Phoenix contexts following DDD:
- `profiles.ex` — main aggregate; `get_profile!/1` eagerly preloads the full graph (certifications, social networks, languages, technologies, jobs → projects → project technologies)
- `jobs.ex`, `certifications.ex`, `social_networks.ex`, `languages.ex`, `projects.ex` — supporting contexts

Schemas live in subdirectories named after their context (e.g. `profiles/profile.ex`).

### Web layer

`lib/software_portfolio_generator_web/` contains:
- `live/profile_live.ex` — single LiveView that fetches the profile and passes assigns to child components
- `components/profile/` — all section components:
  - `personal_information_component.ex` — stateless, renders bio
  - `certifications_component.ex` — stateless, renders certification grid
  - `social_networks_component.ex` — stateless, renders social links
  - `work_experience_component.ex` — **stateful LiveComponent**; handles `select_category` and `select_tech` events to filter jobs by technology

### Component pattern

Components use `update/2` for initialization and `handle_event/3` for interactions. Stateless components receive data via assigns only. Stateful components (like `WorkExperienceComponent`) maintain filter state in socket assigns.

### Frontend

- **Tailwind CSS v4** with **daisyUI** themes (custom light/dark OKLCH themes in `assets/css/app.css`)
- **esbuild** bundles `assets/js/app.js` → `priv/static/assets/js/app.js`
- Theme toggle in root layout uses `localStorage` with system preference fallback

### Profile identity

The profile to display is controlled by the `DEFAULT_PROFILE_ID` environment variable (defaults to `1`).
