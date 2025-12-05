defmodule SoftwarePortfolioGenerator.Projects.ProjectTechnology do
  use Ecto.Schema
  import Ecto.Changeset

  schema "project_technologies" do

    belongs_to :technology, SoftwarePortfolioGenerator.Technologies.Technology, foreign_key: :technology_id, references: :id
    belongs_to :project, SoftwarePortfolioGenerator.Projects.Project, foreign_key: :project_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project_technology, attrs) do
    project_technology
    |> cast(attrs, [])
    |> validate_required([])
  end
end
