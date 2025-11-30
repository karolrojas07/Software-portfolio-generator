defmodule SoftwarePortfolioGenerator.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :link, :string
      add :description, :text
      add :profile_job_id, references(:profile_jobs, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:projects, [:profile_job_id])
  end
end
