defmodule SoftwarePortfolioGenerator.SocialNetworksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SoftwarePortfolioGenerator.SocialNetworks` context.
  """

  @doc """
  Generate a social_network.
  """
  def social_network_fixture(attrs \\ %{}) do
    {:ok, social_network} =
      attrs
      |> Enum.into(%{

      })
      |> SoftwarePortfolioGenerator.SocialNetworks.create_social_network()

    social_network
  end
end
