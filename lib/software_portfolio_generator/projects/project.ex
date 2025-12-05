defmodule SoftwarePortfolioGenerator.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :link, :string
    field :description, :string

    has_many :project_technologies, SoftwarePortfolioGenerator.Projects.ProjectTechnology, foreign_key: :project_id, references: :id
    belongs_to :profile_job, SoftwarePortfolioGenerator.Jobs.ProfileJob, foreign_key: :profile_job_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :link, :description])
    |> validate_required([:name])
  end
end
