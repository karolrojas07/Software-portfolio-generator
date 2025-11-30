defmodule SoftwarePortfolioGenerator.Repo.Migrations.CreateSocialNetworks do
  use Ecto.Migration

  def change do
    create table(:social_networks) do
      add :label, :string
      add :link, :string
      add :icon_link, :string
      add :profile_id, references(:profiles, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:social_networks, [:profile_id])
  end
end
