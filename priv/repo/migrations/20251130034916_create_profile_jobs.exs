defmodule SoftwarePortfolioGenerator.Repo.Migrations.CreateProfileJobs do
  use Ecto.Migration

  def change do
    create table(:profile_jobs) do
      add :company_name, :string
      add :link, :string
      add :description, :text
      add :start_date, :date
      add :end_date, :date
      add :profile_id, references(:profiles, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:profile_jobs, [:profile_id])
  end
end
