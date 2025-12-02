defmodule SoftwarePortfolioGenerator.Repo.Migrations.CreateProjectTechnologies do
  use Ecto.Migration

  def change do
    create table(:project_technologies) do
      add :technology_id, references(:technologies, on_delete: :nothing)
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:project_technologies, [:technology_id])
    create index(:project_technologies, [:project_id])
  end
end
