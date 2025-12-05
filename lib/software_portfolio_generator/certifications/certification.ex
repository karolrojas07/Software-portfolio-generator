defmodule SoftwarePortfolioGenerator.Certifications.Certification do
  use Ecto.Schema
  import Ecto.Changeset

  schema "certifications" do
    field :issuer, :string
    field :name, :string
    field :description, :string
    field :link, :string
    field :end_date, :date

    belongs_to :profile, SoftwarePortfolioGenerator.Profiles.Profile, foreign_key: :profile_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(certification, attrs) do
    certification
    |> cast(attrs, [:issuer, :name, :description, :link, :end_date])
    |> validate_required([:issuer, :name])
  end
end
