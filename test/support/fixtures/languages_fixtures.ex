defmodule SoftwarePortfolioGenerator.LanguagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SoftwarePortfolioGenerator.Languages` context.
  """

  @doc """
  Generate a language.
  """
  def language_fixture(attrs \\ %{}) do
    {:ok, language} =
      attrs
      |> Enum.into(%{

      })
      |> SoftwarePortfolioGenerator.Languages.create_language()

    language
  end
end
