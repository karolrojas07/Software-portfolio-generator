defmodule SoftwarePortfolioGenerator.JobsTest do
  use SoftwarePortfolioGenerator.DataCase

  alias SoftwarePortfolioGenerator.Jobs

  describe "profile_jobs" do
    alias SoftwarePortfolioGenerator.Jobs.ProfileJob

    import SoftwarePortfolioGenerator.JobsFixtures

    @invalid_attrs %{}

    test "list_profile_jobs/0 returns all profile_jobs" do
      profile_job = profile_job_fixture()
      assert Jobs.list_profile_jobs() == [profile_job]
    end

    test "get_profile_job!/1 returns the profile_job with given id" do
      profile_job = profile_job_fixture()
      assert Jobs.get_profile_job!(profile_job.id) == profile_job
    end

    test "create_profile_job/1 with valid data creates a profile_job" do
      valid_attrs = %{}

      assert {:ok, %ProfileJob{} = profile_job} = Jobs.create_profile_job(valid_attrs)
    end

    test "create_profile_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jobs.create_profile_job(@invalid_attrs)
    end

    test "update_profile_job/2 with valid data updates the profile_job" do
      profile_job = profile_job_fixture()
      update_attrs = %{}

      assert {:ok, %ProfileJob{} = profile_job} = Jobs.update_profile_job(profile_job, update_attrs)
    end

    test "update_profile_job/2 with invalid data returns error changeset" do
      profile_job = profile_job_fixture()
      assert {:error, %Ecto.Changeset{}} = Jobs.update_profile_job(profile_job, @invalid_attrs)
      assert profile_job == Jobs.get_profile_job!(profile_job.id)
    end

    test "delete_profile_job/1 deletes the profile_job" do
      profile_job = profile_job_fixture()
      assert {:ok, %ProfileJob{}} = Jobs.delete_profile_job(profile_job)
      assert_raise Ecto.NoResultsError, fn -> Jobs.get_profile_job!(profile_job.id) end
    end

    test "change_profile_job/1 returns a profile_job changeset" do
      profile_job = profile_job_fixture()
      assert %Ecto.Changeset{} = Jobs.change_profile_job(profile_job)
    end
  end
end
