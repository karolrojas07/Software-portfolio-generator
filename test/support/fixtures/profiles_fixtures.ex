defmodule SoftwarePortfolioGenerator.ProfilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SoftwarePortfolioGenerator.Profiles` context.
  """

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{

      })
      |> SoftwarePortfolioGenerator.Profiles.create_profile()

    profile
  end

  @doc """
  Generate a certification.
  """
  def certification_fixture(attrs \\ %{}) do
    {:ok, certification} =
      attrs
      |> Enum.into(%{

      })
      |> SoftwarePortfolioGenerator.Profiles.create_certification()

    certification
  end

  @doc """
  Generate a profile_language.
  """
  def profile_language_fixture(attrs \\ %{}) do
    {:ok, profile_language} =
      attrs
      |> Enum.into(%{

      })
      |> SoftwarePortfolioGenerator.Profiles.create_profile_language()

    profile_language
  end

  @doc """
  Generate a profile_technology.
  """
  def profile_technology_fixture(attrs \\ %{}) do
    {:ok, profile_technology} =
      attrs
      |> Enum.into(%{

      })
      |> SoftwarePortfolioGenerator.Profiles.create_profile_technology()

    profile_technology
  end
end
