defmodule SoftwarePortfolioGenerator.SocialNetworksTest do
  use SoftwarePortfolioGenerator.DataCase

  alias SoftwarePortfolioGenerator.SocialNetworks

  describe "social_networks" do
    alias SoftwarePortfolioGenerator.SocialNetworks.SocialNetwork

    import SoftwarePortfolioGenerator.SocialNetworksFixtures

    @invalid_attrs %{}

    test "list_social_networks/0 returns all social_networks" do
      social_network = social_network_fixture()
      assert SocialNetworks.list_social_networks() == [social_network]
    end

    test "get_social_network!/1 returns the social_network with given id" do
      social_network = social_network_fixture()
      assert SocialNetworks.get_social_network!(social_network.id) == social_network
    end

    test "create_social_network/1 with valid data creates a social_network" do
      valid_attrs = %{}

      assert {:ok, %SocialNetwork{} = social_network} = SocialNetworks.create_social_network(valid_attrs)
    end

    test "create_social_network/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SocialNetworks.create_social_network(@invalid_attrs)
    end

    test "update_social_network/2 with valid data updates the social_network" do
      social_network = social_network_fixture()
      update_attrs = %{}

      assert {:ok, %SocialNetwork{} = social_network} = SocialNetworks.update_social_network(social_network, update_attrs)
    end

    test "update_social_network/2 with invalid data returns error changeset" do
      social_network = social_network_fixture()
      assert {:error, %Ecto.Changeset{}} = SocialNetworks.update_social_network(social_network, @invalid_attrs)
      assert social_network == SocialNetworks.get_social_network!(social_network.id)
    end

    test "delete_social_network/1 deletes the social_network" do
      social_network = social_network_fixture()
      assert {:ok, %SocialNetwork{}} = SocialNetworks.delete_social_network(social_network)
      assert_raise Ecto.NoResultsError, fn -> SocialNetworks.get_social_network!(social_network.id) end
    end

    test "change_social_network/1 returns a social_network changeset" do
      social_network = social_network_fixture()
      assert %Ecto.Changeset{} = SocialNetworks.change_social_network(social_network)
    end
  end
end
