defmodule SoftwarePortfolioGenerator.Repo.Migrations.CreateTechnologies do
  use Ecto.Migration

  def change do
    create table(:technologies) do
      add :name, :string
      add :icon_link, :string
      add :category_id, references(:technology_categories, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:technologies, [:category_id])
  end
end
