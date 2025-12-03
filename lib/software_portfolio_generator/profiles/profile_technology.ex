defmodule SoftwarePortfolioGenerator.Profiles.ProfileTechnology do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profile_technologies" do
    field :mastery, :float
    field :profile_id, :id
    field :technology_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(profile_technology, attrs) do
    profile_technology
    |> cast(attrs, [:mastery])
    |> validate_required([:mastery])
  end
end
