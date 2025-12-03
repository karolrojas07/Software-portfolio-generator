defmodule SoftwarePortfolioGenerator.CertificationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SoftwarePortfolioGenerator.Certifications` context.
  """

  @doc """
  Generate a certification.
  """
  def certification_fixture(attrs \\ %{}) do
    {:ok, certification} =
      attrs
      |> Enum.into(%{

      })
      |> SoftwarePortfolioGenerator.Certifications.create_certification()

    certification
  end
end
