defmodule SoftwarePortfolioGenerator.ProfilesTest do
  use SoftwarePortfolioGenerator.DataCase

  alias SoftwarePortfolioGenerator.Profiles

  describe "profiles" do
    alias SoftwarePortfolioGenerator.Profiles.Profile

    import SoftwarePortfolioGenerator.ProfilesFixtures

    @invalid_attrs %{}

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Profiles.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Profiles.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      valid_attrs = %{}

      assert {:ok, %Profile{} = profile} = Profiles.create_profile(valid_attrs)
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profiles.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      update_attrs = %{}

      assert {:ok, %Profile{} = profile} = Profiles.update_profile(profile, update_attrs)
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Profiles.update_profile(profile, @invalid_attrs)
      assert profile == Profiles.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Profiles.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Profiles.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Profiles.change_profile(profile)
    end
  end

  describe "certifications" do
    alias SoftwarePortfolioGenerator.Profiles.Certification

    import SoftwarePortfolioGenerator.ProfilesFixtures

    @invalid_attrs %{}

    test "list_certifications/0 returns all certifications" do
      certification = certification_fixture()
      assert Profiles.list_certifications() == [certification]
    end

    test "get_certification!/1 returns the certification with given id" do
      certification = certification_fixture()
      assert Profiles.get_certification!(certification.id) == certification
    end

    test "create_certification/1 with valid data creates a certification" do
      valid_attrs = %{}

      assert {:ok, %Certification{} = certification} = Profiles.create_certification(valid_attrs)
    end

    test "create_certification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profiles.create_certification(@invalid_attrs)
    end

    test "update_certification/2 with valid data updates the certification" do
      certification = certification_fixture()
      update_attrs = %{}

      assert {:ok, %Certification{} = certification} = Profiles.update_certification(certification, update_attrs)
    end

    test "update_certification/2 with invalid data returns error changeset" do
      certification = certification_fixture()
      assert {:error, %Ecto.Changeset{}} = Profiles.update_certification(certification, @invalid_attrs)
      assert certification == Profiles.get_certification!(certification.id)
    end

    test "delete_certification/1 deletes the certification" do
      certification = certification_fixture()
      assert {:ok, %Certification{}} = Profiles.delete_certification(certification)
      assert_raise Ecto.NoResultsError, fn -> Profiles.get_certification!(certification.id) end
    end

    test "change_certification/1 returns a certification changeset" do
      certification = certification_fixture()
      assert %Ecto.Changeset{} = Profiles.change_certification(certification)
    end
  end

  describe "profile_languages" do
    alias SoftwarePortfolioGenerator.Profiles.ProfileLanguage

    import SoftwarePortfolioGenerator.ProfilesFixtures

    @invalid_attrs %{}

    test "list_profile_languages/0 returns all profile_languages" do
      profile_language = profile_language_fixture()
      assert Profiles.list_profile_languages() == [profile_language]
    end

    test "get_profile_language!/1 returns the profile_language with given id" do
      profile_language = profile_language_fixture()
      assert Profiles.get_profile_language!(profile_language.id) == profile_language
    end

    test "create_profile_language/1 with valid data creates a profile_language" do
      valid_attrs = %{}

      assert {:ok, %ProfileLanguage{} = profile_language} = Profiles.create_profile_language(valid_attrs)
    end

    test "create_profile_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profiles.create_profile_language(@invalid_attrs)
    end

    test "update_profile_language/2 with valid data updates the profile_language" do
      profile_language = profile_language_fixture()
      update_attrs = %{}

      assert {:ok, %ProfileLanguage{} = profile_language} = Profiles.update_profile_language(profile_language, update_attrs)
    end

    test "update_profile_language/2 with invalid data returns error changeset" do
      profile_language = profile_language_fixture()
      assert {:error, %Ecto.Changeset{}} = Profiles.update_profile_language(profile_language, @invalid_attrs)
      assert profile_language == Profiles.get_profile_language!(profile_language.id)
    end

    test "delete_profile_language/1 deletes the profile_language" do
      profile_language = profile_language_fixture()
      assert {:ok, %ProfileLanguage{}} = Profiles.delete_profile_language(profile_language)
      assert_raise Ecto.NoResultsError, fn -> Profiles.get_profile_language!(profile_language.id) end
    end

    test "change_profile_language/1 returns a profile_language changeset" do
      profile_language = profile_language_fixture()
      assert %Ecto.Changeset{} = Profiles.change_profile_language(profile_language)
    end
  end

  describe "profile_technologies" do
    alias SoftwarePortfolioGenerator.Profiles.ProfileTechnology

    import SoftwarePortfolioGenerator.ProfilesFixtures

    @invalid_attrs %{}

    test "list_profile_technologies/0 returns all profile_technologies" do
      profile_technology = profile_technology_fixture()
      assert Profiles.list_profile_technologies() == [profile_technology]
    end

    test "get_profile_technology!/1 returns the profile_technology with given id" do
      profile_technology = profile_technology_fixture()
      assert Profiles.get_profile_technology!(profile_technology.id) == profile_technology
    end

    test "create_profile_technology/1 with valid data creates a profile_technology" do
      valid_attrs = %{}

      assert {:ok, %ProfileTechnology{} = profile_technology} = Profiles.create_profile_technology(valid_attrs)
    end

    test "create_profile_technology/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profiles.create_profile_technology(@invalid_attrs)
    end

    test "update_profile_technology/2 with valid data updates the profile_technology" do
      profile_technology = profile_technology_fixture()
      update_attrs = %{}

      assert {:ok, %ProfileTechnology{} = profile_technology} = Profiles.update_profile_technology(profile_technology, update_attrs)
    end

    test "update_profile_technology/2 with invalid data returns error changeset" do
      profile_technology = profile_technology_fixture()
      assert {:error, %Ecto.Changeset{}} = Profiles.update_profile_technology(profile_technology, @invalid_attrs)
      assert profile_technology == Profiles.get_profile_technology!(profile_technology.id)
    end

    test "delete_profile_technology/1 deletes the profile_technology" do
      profile_technology = profile_technology_fixture()
      assert {:ok, %ProfileTechnology{}} = Profiles.delete_profile_technology(profile_technology)
      assert_raise Ecto.NoResultsError, fn -> Profiles.get_profile_technology!(profile_technology.id) end
    end

    test "change_profile_technology/1 returns a profile_technology changeset" do
      profile_technology = profile_technology_fixture()
      assert %Ecto.Changeset{} = Profiles.change_profile_technology(profile_technology)
    end
  end
end
