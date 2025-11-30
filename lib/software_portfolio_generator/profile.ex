defmodule SoftwarePortfolioGenerator.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :firstname, :string
    field :lastname, :string
    field :age, :date
    field :email, :string
    field :city, :string
    field :state, :string
    field :country, :string
    field :zipcode, :string
    field :phone_number, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:firstname, :lastname, :age, :email, :city, :state, :country, :zipcode, :phone_number])
    |> validate_required([:firstname, :lastname, :email])
  end
end
