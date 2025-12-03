defmodule SoftwarePortfolioGenerator.SocialNetworks do
  @moduledoc """
  The SocialNetworks context.
  """

  import Ecto.Query, warn: false
  alias SoftwarePortfolioGenerator.Repo

  alias SoftwarePortfolioGenerator.SocialNetworks.SocialNetwork

  @doc """
  Returns the list of social_networks.

  ## Examples

      iex> list_social_networks()
      [%SocialNetwork{}, ...]

  """
  def list_social_networks do
    Repo.all(SocialNetwork)
  end

  @doc """
  Gets a single social_network.

  Raises `Ecto.NoResultsError` if the Social network does not exist.

  ## Examples

      iex> get_social_network!(123)
      %SocialNetwork{}

      iex> get_social_network!(456)
      ** (Ecto.NoResultsError)

  """
  def get_social_network!(id), do: Repo.get!(SocialNetwork, id)

  @doc """
  Creates a social_network.

  ## Examples

      iex> create_social_network(%{field: value})
      {:ok, %SocialNetwork{}}

      iex> create_social_network(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_social_network(attrs) do
    %SocialNetwork{}
    |> SocialNetwork.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a social_network.

  ## Examples

      iex> update_social_network(social_network, %{field: new_value})
      {:ok, %SocialNetwork{}}

      iex> update_social_network(social_network, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_social_network(%SocialNetwork{} = social_network, attrs) do
    social_network
    |> SocialNetwork.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a social_network.

  ## Examples

      iex> delete_social_network(social_network)
      {:ok, %SocialNetwork{}}

      iex> delete_social_network(social_network)
      {:error, %Ecto.Changeset{}}

  """
  def delete_social_network(%SocialNetwork{} = social_network) do
    Repo.delete(social_network)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking social_network changes.

  ## Examples

      iex> change_social_network(social_network)
      %Ecto.Changeset{data: %SocialNetwork{}}

  """
  def change_social_network(%SocialNetwork{} = social_network, attrs \\ %{}) do
    SocialNetwork.changeset(social_network, attrs)
  end
end
