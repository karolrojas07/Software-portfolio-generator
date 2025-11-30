defmodule SoftwarePortfolioGenerator.Repo.Migrations.CreateProfileTechnologies do
  use Ecto.Migration

  def change do
    create table(:profile_technologies) do
      add :mastery, :float
      add :profile_id, references(:profiles, on_delete: :nothing)
      add :technology_id, references(:technologies, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:profile_technologies, [:profile_id])
    create index(:profile_technologies, [:technology_id])
  end
end
