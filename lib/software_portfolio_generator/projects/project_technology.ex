defmodule SoftwarePortfolioGenerator.Projects.ProjectTechnology do
  use Ecto.Schema
  import Ecto.Changeset

  schema "project_technologies" do

    field :technology_id, :id
    field :project_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project_technology, attrs) do
    project_technology
    |> cast(attrs, [:technology_id, :project_id])
    |> validate_required([:technology_id, :project_id])
  end
end
