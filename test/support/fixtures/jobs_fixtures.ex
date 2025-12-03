defmodule SoftwarePortfolioGenerator.JobsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SoftwarePortfolioGenerator.Jobs` context.
  """

  @doc """
  Generate a profile_job.
  """
  def profile_job_fixture(attrs \\ %{}) do
    {:ok, profile_job} =
      attrs
      |> Enum.into(%{

      })
      |> SoftwarePortfolioGenerator.Jobs.create_profile_job()

    profile_job
  end
end
