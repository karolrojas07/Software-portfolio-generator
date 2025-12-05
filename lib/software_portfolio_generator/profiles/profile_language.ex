defmodule SoftwarePortfolioGenerator.Profiles.ProfileLanguage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profile_languages" do
    field :level, :string

    belongs_to :profile, SoftwarePortfolioGenerator.Profiles.Profile, foreign_key: :profile_id, references: :id
    belongs_to :language, SoftwarePortfolioGenerator.Languages.Language, foreign_key: :language_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(profile_language, attrs) do
    profile_language
    |> cast(attrs, [:level])
    |> validate_required([:level])
  end
end
