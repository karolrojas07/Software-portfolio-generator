defmodule SoftwarePortfolioGenerator.Profiles.ProfileTechnology do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profile_technologies" do
    field :mastery, :float

    belongs_to :profile, SoftwarePortfolioGenerator.Profiles.Profile, foreign_key: :profile_id, references: :id
    belongs_to :technology, SoftwarePortfolioGenerator.Technologies.Technology, foreign_key: :technology_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(profile_technology, attrs) do
    profile_technology
    |> cast(attrs, [:mastery])
    |> validate_required([:mastery])
  end
end
