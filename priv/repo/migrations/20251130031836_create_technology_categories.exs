defmodule SoftwarePortfolioGenerator.Repo.Migrations.CreateTechnologyCategories do
  use Ecto.Migration

  def change do
    create table(:technology_categories) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
