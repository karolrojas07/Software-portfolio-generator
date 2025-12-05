defmodule SoftwarePortfolioGenerator.Languages.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "languages" do
    field :name, :string

    has_many :profile_languages, SoftwarePortfolioGenerator.Profiles.ProfileLanguage, foreign_key: :language_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
