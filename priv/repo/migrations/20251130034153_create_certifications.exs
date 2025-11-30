defmodule SoftwarePortfolioGenerator.Repo.Migrations.CreateCertifications do
  use Ecto.Migration

  def change do
    create table(:certifications) do
      add :issuer, :string
      add :name, :string
      add :description, :text
      add :link, :string
      add :end_date, :date
      add :profile_id, references(:profiles, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:certifications, [:profile_id])
  end
end
