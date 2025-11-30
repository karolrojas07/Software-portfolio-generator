defmodule SoftwarePortfolioGenerator.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :link, :string
    field :description, :string
    field :profile_job_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :link, :description])
    |> validate_required([:name])
  end
end
