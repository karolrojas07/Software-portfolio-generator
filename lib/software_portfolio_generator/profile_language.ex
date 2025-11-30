defmodule SoftwarePortfolioGenerator.ProfileLanguage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profile_languages" do
    field :level, :string
    field :profile_id, :id
    field :language_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(profile_language, attrs) do
    profile_language
    |> cast(attrs, [:level])
    |> validate_required([:level])
  end
end
