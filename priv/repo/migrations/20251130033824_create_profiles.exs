defmodule SoftwarePortfolioGenerator.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :firstname, :string
      add :lastname, :string
      add :title, :string
      add :birthdate, :date
      add :email, :string
      add :city, :string
      add :state, :string
      add :country, :string
      add :zipcode, :string
      add :phone_number, :string

      timestamps(type: :utc_datetime)
    end
  end
end
