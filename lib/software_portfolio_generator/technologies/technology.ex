defmodule SoftwarePortfolioGenerator.Technologies.Technology do
  use Ecto.Schema
  import Ecto.Changeset

  schema "technologies" do
    field :name, :string
    field :icon_link, :string

    belongs_to :category, SoftwarePortfolioGenerator.Technologies.TechnologyCategory, foreign_key: :category_id, references: :id
    has_many :profile_technologies, SoftwarePortfolioGenerator.Profiles.ProfileTechnology, foreign_key: :technology_id, references: :id
    has_many :project_technologies, SoftwarePortfolioGenerator.Projects.ProjectTechnology, foreign_key: :technology_id, references: :id
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(technology, attrs) do
    technology
    |> cast(attrs, [:name, :icon_link])
    |> validate_required([:name])
  end
end
