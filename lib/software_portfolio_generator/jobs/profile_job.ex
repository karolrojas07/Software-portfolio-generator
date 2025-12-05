defmodule SoftwarePortfolioGenerator.Jobs.ProfileJob do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profile_jobs" do
    field :company_name, :string
    field :link, :string
    field :description, :string
    field :start_date, :date
    field :end_date, :date

    has_many :projects, SoftwarePortfolioGenerator.Projects.Project, foreign_key: :profile_job_id, references: :id
    belongs_to :profile, SoftwarePortfolioGenerator.Profiles.Profile, foreign_key: :profile_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(profile_job, attrs) do
    profile_job
    |> cast(attrs, [:company_name, :link, :description, :start_date, :end_date])
    |> validate_required([:company_name])
  end
end
