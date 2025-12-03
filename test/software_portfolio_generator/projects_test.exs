defmodule SoftwarePortfolioGenerator.ProjectsTest do
  use SoftwarePortfolioGenerator.DataCase

  alias SoftwarePortfolioGenerator.Projects

  describe "projects" do
    alias SoftwarePortfolioGenerator.Projects.Project

    import SoftwarePortfolioGenerator.ProjectsFixtures

    @invalid_attrs %{}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{}

      assert {:ok, %Project{} = project} = Projects.create_project(valid_attrs)
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{}

      assert {:ok, %Project{} = project} = Projects.update_project(project, update_attrs)
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "project_technologies" do
    alias SoftwarePortfolioGenerator.Projects.ProjectTechnology

    import SoftwarePortfolioGenerator.ProjectsFixtures

    @invalid_attrs %{}

    test "list_project_technologies/0 returns all project_technologies" do
      project_technology = project_technology_fixture()
      assert Projects.list_project_technologies() == [project_technology]
    end

    test "get_project_technology!/1 returns the project_technology with given id" do
      project_technology = project_technology_fixture()
      assert Projects.get_project_technology!(project_technology.id) == project_technology
    end

    test "create_project_technology/1 with valid data creates a project_technology" do
      valid_attrs = %{}

      assert {:ok, %ProjectTechnology{} = project_technology} = Projects.create_project_technology(valid_attrs)
    end

    test "create_project_technology/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project_technology(@invalid_attrs)
    end

    test "update_project_technology/2 with valid data updates the project_technology" do
      project_technology = project_technology_fixture()
      update_attrs = %{}

      assert {:ok, %ProjectTechnology{} = project_technology} = Projects.update_project_technology(project_technology, update_attrs)
    end

    test "update_project_technology/2 with invalid data returns error changeset" do
      project_technology = project_technology_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project_technology(project_technology, @invalid_attrs)
      assert project_technology == Projects.get_project_technology!(project_technology.id)
    end

    test "delete_project_technology/1 deletes the project_technology" do
      project_technology = project_technology_fixture()
      assert {:ok, %ProjectTechnology{}} = Projects.delete_project_technology(project_technology)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project_technology!(project_technology.id) end
    end

    test "change_project_technology/1 returns a project_technology changeset" do
      project_technology = project_technology_fixture()
      assert %Ecto.Changeset{} = Projects.change_project_technology(project_technology)
    end
  end
end
