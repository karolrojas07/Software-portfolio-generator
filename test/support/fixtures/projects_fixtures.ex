defmodule SoftwarePortfolioGenerator.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SoftwarePortfolioGenerator.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{

      })
      |> SoftwarePortfolioGenerator.Projects.create_project()

    project
  end

  @doc """
  Generate a project_technology.
  """
  def project_technology_fixture(attrs \\ %{}) do
    {:ok, project_technology} =
      attrs
      |> Enum.into(%{

      })
      |> SoftwarePortfolioGenerator.Projects.create_project_technology()

    project_technology
  end
end
