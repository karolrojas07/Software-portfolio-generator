defmodule SoftwarePortfolioGenerator.Profiles.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :firstname, :string
    field :lastname, :string
    field :title, :string
    field :birthdate, :date
    field :email, :string
    field :city, :string
    field :state, :string
    field :country, :string
    field :zipcode, :string
    field :phone_number, :string

    has_many :certifications, SoftwarePortfolioGenerator.Certifications.Certification, foreign_key: :profile_id, references: :id
    has_many :social_networks, SoftwarePortfolioGenerator.SocialNetworks.SocialNetwork, foreign_key: :profile_id, references: :id
    has_many :profile_jobs, SoftwarePortfolioGenerator.Jobs.ProfileJob, foreign_key: :profile_id, references: :id
    has_many :profile_languages, SoftwarePortfolioGenerator.Profiles.ProfileLanguage, foreign_key: :profile_id, references: :id
    has_many :profile_technologies, SoftwarePortfolioGenerator.Profiles.ProfileTechnology, foreign_key: :profile_id, references: :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:firstname, :lastname, :birthdate, :email, :city, :state, :country, :zipcode, :phone_number])
    |> validate_required([:firstname, :lastname, :email])
  end
end
