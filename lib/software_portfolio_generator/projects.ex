defmodule SoftwarePortfolioGenerator.Projects do
  @moduledoc """
  The Projects context.
  """

  import Ecto.Query, warn: false
  alias SoftwarePortfolioGenerator.Repo

  alias SoftwarePortfolioGenerator.Projects.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  alias SoftwarePortfolioGenerator.Projects.ProjectTechnology

  @doc """
  Returns the list of project_technologies.

  ## Examples

      iex> list_project_technologies()
      [%ProjectTechnology{}, ...]

  """
  def list_project_technologies do
    Repo.all(ProjectTechnology)
  end

  @doc """
  Gets a single project_technology.

  Raises `Ecto.NoResultsError` if the Project technology does not exist.

  ## Examples

      iex> get_project_technology!(123)
      %ProjectTechnology{}

      iex> get_project_technology!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project_technology!(id), do: Repo.get!(ProjectTechnology, id)

  @doc """
  Creates a project_technology.

  ## Examples

      iex> create_project_technology(%{field: value})
      {:ok, %ProjectTechnology{}}

      iex> create_project_technology(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project_technology(attrs) do
    %ProjectTechnology{}
    |> ProjectTechnology.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project_technology.

  ## Examples

      iex> update_project_technology(project_technology, %{field: new_value})
      {:ok, %ProjectTechnology{}}

      iex> update_project_technology(project_technology, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project_technology(%ProjectTechnology{} = project_technology, attrs) do
    project_technology
    |> ProjectTechnology.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project_technology.

  ## Examples

      iex> delete_project_technology(project_technology)
      {:ok, %ProjectTechnology{}}

      iex> delete_project_technology(project_technology)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project_technology(%ProjectTechnology{} = project_technology) do
    Repo.delete(project_technology)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project_technology changes.

  ## Examples

      iex> change_project_technology(project_technology)
      %Ecto.Changeset{data: %ProjectTechnology{}}

  """
  def change_project_technology(%ProjectTechnology{} = project_technology, attrs \\ %{}) do
    ProjectTechnology.changeset(project_technology, attrs)
  end
end
