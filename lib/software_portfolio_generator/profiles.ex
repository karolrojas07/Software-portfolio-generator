defmodule SoftwarePortfolioGenerator.Profiles do
  @moduledoc """
  The Profiles context.
  """

  import Ecto.Query, warn: false
  alias SoftwarePortfolioGenerator.Repo

  alias SoftwarePortfolioGenerator.Profiles.Profile

  @doc """
  Returns the list of profiles.

  ## Examples

      iex> list_profiles()
      [%Profile{}, ...]

  """
  def list_profiles do
    Repo.all(Profile)
  end

  @doc """
  Gets a single profile.

  Raises `Ecto.NoResultsError` if the Profile does not exist.

  ## Examples

      iex> get_profile!(123)
      %Profile{}

      iex> get_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profile!(id), do: Repo.get!(Profile, id)

  @doc """
  Creates a profile.

  ## Examples

      iex> create_profile(%{field: value})
      {:ok, %Profile{}}

      iex> create_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profile(attrs) do
    %Profile{}
    |> Profile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profile.

  ## Examples

      iex> update_profile(profile, %{field: new_value})
      {:ok, %Profile{}}

      iex> update_profile(profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profile(%Profile{} = profile, attrs) do
    profile
    |> Profile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a profile.

  ## Examples

      iex> delete_profile(profile)
      {:ok, %Profile{}}

      iex> delete_profile(profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profile(%Profile{} = profile) do
    Repo.delete(profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profile changes.

  ## Examples

      iex> change_profile(profile)
      %Ecto.Changeset{data: %Profile{}}

  """
  def change_profile(%Profile{} = profile, attrs \\ %{}) do
    Profile.changeset(profile, attrs)
  end

  alias SoftwarePortfolioGenerator.Profiles.ProfileLanguage

  @doc """
  Returns the list of profile_languages.

  ## Examples

      iex> list_profile_languages()
      [%ProfileLanguage{}, ...]

  """
  def list_profile_languages do
    Repo.all(ProfileLanguage)
  end

  @doc """
  Gets a single profile_language.

  Raises `Ecto.NoResultsError` if the Profile language does not exist.

  ## Examples

      iex> get_profile_language!(123)
      %ProfileLanguage{}

      iex> get_profile_language!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profile_language!(id), do: Repo.get!(ProfileLanguage, id)

  @doc """
  Creates a profile_language.

  ## Examples

      iex> create_profile_language(%{field: value})
      {:ok, %ProfileLanguage{}}

      iex> create_profile_language(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profile_language(attrs) do
    %ProfileLanguage{}
    |> ProfileLanguage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profile_language.

  ## Examples

      iex> update_profile_language(profile_language, %{field: new_value})
      {:ok, %ProfileLanguage{}}

      iex> update_profile_language(profile_language, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profile_language(%ProfileLanguage{} = profile_language, attrs) do
    profile_language
    |> ProfileLanguage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a profile_language.

  ## Examples

      iex> delete_profile_language(profile_language)
      {:ok, %ProfileLanguage{}}

      iex> delete_profile_language(profile_language)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profile_language(%ProfileLanguage{} = profile_language) do
    Repo.delete(profile_language)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profile_language changes.

  ## Examples

      iex> change_profile_language(profile_language)
      %Ecto.Changeset{data: %ProfileLanguage{}}

  """
  def change_profile_language(%ProfileLanguage{} = profile_language, attrs \\ %{}) do
    ProfileLanguage.changeset(profile_language, attrs)
  end

  alias SoftwarePortfolioGenerator.Profiles.ProfileTechnology

  @doc """
  Returns the list of profile_technologies.

  ## Examples

      iex> list_profile_technologies()
      [%ProfileTechnology{}, ...]

  """
  def list_profile_technologies do
    Repo.all(ProfileTechnology)
  end

  @doc """
  Gets a single profile_technology.

  Raises `Ecto.NoResultsError` if the Profile technology does not exist.

  ## Examples

      iex> get_profile_technology!(123)
      %ProfileTechnology{}

      iex> get_profile_technology!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profile_technology!(id), do: Repo.get!(ProfileTechnology, id)

  @doc """
  Creates a profile_technology.

  ## Examples

      iex> create_profile_technology(%{field: value})
      {:ok, %ProfileTechnology{}}

      iex> create_profile_technology(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profile_technology(attrs) do
    %ProfileTechnology{}
    |> ProfileTechnology.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profile_technology.

  ## Examples

      iex> update_profile_technology(profile_technology, %{field: new_value})
      {:ok, %ProfileTechnology{}}

      iex> update_profile_technology(profile_technology, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profile_technology(%ProfileTechnology{} = profile_technology, attrs) do
    profile_technology
    |> ProfileTechnology.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a profile_technology.

  ## Examples

      iex> delete_profile_technology(profile_technology)
      {:ok, %ProfileTechnology{}}

      iex> delete_profile_technology(profile_technology)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profile_technology(%ProfileTechnology{} = profile_technology) do
    Repo.delete(profile_technology)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profile_technology changes.

  ## Examples

      iex> change_profile_technology(profile_technology)
      %Ecto.Changeset{data: %ProfileTechnology{}}

  """
  def change_profile_technology(%ProfileTechnology{} = profile_technology, attrs \\ %{}) do
    ProfileTechnology.changeset(profile_technology, attrs)
  end
end
