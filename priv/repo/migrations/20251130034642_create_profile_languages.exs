defmodule SoftwarePortfolioGenerator.Repo.Migrations.CreateProfileLanguages do
  use Ecto.Migration

  def change do
    create table(:profile_languages) do
      add :level, :string
      add :profile_id, references(:profiles, on_delete: :nothing)
      add :language_id, references(:languages, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:profile_languages, [:profile_id])
    create index(:profile_languages, [:language_id])
  end
end
