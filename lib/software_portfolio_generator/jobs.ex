defmodule SoftwarePortfolioGenerator.Jobs do
  @moduledoc """
  The Jobs context.
  """

  import Ecto.Query, warn: false
  alias SoftwarePortfolioGenerator.Repo

  alias SoftwarePortfolioGenerator.Jobs.ProfileJob

  @doc """
  Returns the list of profile_jobs.

  ## Examples

      iex> list_profile_jobs()
      [%ProfileJob{}, ...]

  """
  def list_profile_jobs do
    Repo.all(ProfileJob)
  end

  @doc """
  Gets a single profile_job.

  Raises `Ecto.NoResultsError` if the Profile job does not exist.

  ## Examples

      iex> get_profile_job!(123)
      %ProfileJob{}

      iex> get_profile_job!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profile_job!(id), do: Repo.get!(ProfileJob, id)

  @doc """
  Creates a profile_job.

  ## Examples

      iex> create_profile_job(%{field: value})
      {:ok, %ProfileJob{}}

      iex> create_profile_job(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profile_job(attrs) do
    %ProfileJob{}
    |> ProfileJob.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profile_job.

  ## Examples

      iex> update_profile_job(profile_job, %{field: new_value})
      {:ok, %ProfileJob{}}

      iex> update_profile_job(profile_job, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profile_job(%ProfileJob{} = profile_job, attrs) do
    profile_job
    |> ProfileJob.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a profile_job.

  ## Examples

      iex> delete_profile_job(profile_job)
      {:ok, %ProfileJob{}}

      iex> delete_profile_job(profile_job)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profile_job(%ProfileJob{} = profile_job) do
    Repo.delete(profile_job)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profile_job changes.

  ## Examples

      iex> change_profile_job(profile_job)
      %Ecto.Changeset{data: %ProfileJob{}}

  """
  def change_profile_job(%ProfileJob{} = profile_job, attrs \\ %{}) do
    ProfileJob.changeset(profile_job, attrs)
  end
end
