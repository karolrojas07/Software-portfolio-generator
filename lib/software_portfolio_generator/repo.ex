defmodule SoftwarePortfolioGenerator.Repo do
  use Ecto.Repo,
    otp_app: :software_portfolio_generator,
    adapter: Ecto.Adapters.Postgres
end
