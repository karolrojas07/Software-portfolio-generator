defmodule SoftwarePortfolioGenerator.SocialNetworks.SocialNetwork do
  use Ecto.Schema
  import Ecto.Changeset

  schema "social_networks" do
    field :label, :string
    field :link, :string
    field :icon_link, :string

    belongs_to :profile, SoftwarePortfolioGenerator.Profiles.Profile, foreign_key: :profile_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(social_network, attrs) do
    social_network
    |> cast(attrs, [:label, :link, :icon_link])
    |> validate_required([:label, :link])
  end
end
