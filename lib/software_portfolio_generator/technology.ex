defmodule SoftwarePortfolioGenerator.Technology do
  use Ecto.Schema
  import Ecto.Changeset

  schema "technologies" do
    field :name, :string
    field :icon_link, :string
    field :category_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(technology, attrs) do
    technology
    |> cast(attrs, [:name, :icon_link])
    |> validate_required([:name])
  end
end
