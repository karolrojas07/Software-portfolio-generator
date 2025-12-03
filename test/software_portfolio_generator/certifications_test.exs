defmodule SoftwarePortfolioGenerator.CertificationsTest do
  use SoftwarePortfolioGenerator.DataCase

  alias SoftwarePortfolioGenerator.Certifications

  describe "certifications" do
    alias SoftwarePortfolioGenerator.Certifications.Certification

    import SoftwarePortfolioGenerator.CertificationsFixtures

    @invalid_attrs %{}

    test "list_certifications/0 returns all certifications" do
      certification = certification_fixture()
      assert Certifications.list_certifications() == [certification]
    end

    test "get_certification!/1 returns the certification with given id" do
      certification = certification_fixture()
      assert Certifications.get_certification!(certification.id) == certification
    end

    test "create_certification/1 with valid data creates a certification" do
      valid_attrs = %{}

      assert {:ok, %Certification{} = certification} = Certifications.create_certification(valid_attrs)
    end

    test "create_certification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Certifications.create_certification(@invalid_attrs)
    end

    test "update_certification/2 with valid data updates the certification" do
      certification = certification_fixture()
      update_attrs = %{}

      assert {:ok, %Certification{} = certification} = Certifications.update_certification(certification, update_attrs)
    end

    test "update_certification/2 with invalid data returns error changeset" do
      certification = certification_fixture()
      assert {:error, %Ecto.Changeset{}} = Certifications.update_certification(certification, @invalid_attrs)
      assert certification == Certifications.get_certification!(certification.id)
    end

    test "delete_certification/1 deletes the certification" do
      certification = certification_fixture()
      assert {:ok, %Certification{}} = Certifications.delete_certification(certification)
      assert_raise Ecto.NoResultsError, fn -> Certifications.get_certification!(certification.id) end
    end

    test "change_certification/1 returns a certification changeset" do
      certification = certification_fixture()
      assert %Ecto.Changeset{} = Certifications.change_certification(certification)
    end
  end
end
