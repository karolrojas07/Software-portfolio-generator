defmodule SoftwarePortfolioGenerator.Technologies.TechnologyCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "technology_categories" do
    field :name, :string

    has_many :technologies, SoftwarePortfolioGenerator.Technologies.Technology, foreign_key: :category_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(technology_category, attrs) do
    technology_category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
