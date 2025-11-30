defmodule SoftwarePortfolioGenerator.ProjectTechnology do
  use Ecto.Schema
  import Ecto.Changeset

  schema "project_technologies" do

    field :profile_id, :id
    field :project_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project_technology, attrs) do
    project_technology
    |> cast(attrs, [])
    |> validate_required([])
  end
end
