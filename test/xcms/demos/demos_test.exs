defmodule Xcms.DemosTest do
  use Xcms.DataCase

  alias Xcms.Demos

  describe "husers" do
    alias Xcms.Demos.HUser

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def h_user_fixture(attrs \\ %{}) do
      {:ok, h_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Demos.create_h_user()

      h_user
    end

    test "list_husers/0 returns all husers" do
      h_user = h_user_fixture()
      assert Demos.list_husers() == [h_user]
    end

    test "get_h_user!/1 returns the h_user with given id" do
      h_user = h_user_fixture()
      assert Demos.get_h_user!(h_user.id) == h_user
    end

    test "create_h_user/1 with valid data creates a h_user" do
      assert {:ok, %HUser{} = h_user} = Demos.create_h_user(@valid_attrs)
      assert h_user.name == "some name"
    end

    test "create_h_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Demos.create_h_user(@invalid_attrs)
    end

    test "update_h_user/2 with valid data updates the h_user" do
      h_user = h_user_fixture()
      assert {:ok, %HUser{} = h_user} = Demos.update_h_user(h_user, @update_attrs)
      assert h_user.name == "some updated name"
    end

    test "update_h_user/2 with invalid data returns error changeset" do
      h_user = h_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Demos.update_h_user(h_user, @invalid_attrs)
      assert h_user == Demos.get_h_user!(h_user.id)
    end

    test "delete_h_user/1 deletes the h_user" do
      h_user = h_user_fixture()
      assert {:ok, %HUser{}} = Demos.delete_h_user(h_user)
      assert_raise Ecto.NoResultsError, fn -> Demos.get_h_user!(h_user.id) end
    end

    test "change_h_user/1 returns a h_user changeset" do
      h_user = h_user_fixture()
      assert %Ecto.Changeset{} = Demos.change_h_user(h_user)
    end
  end
end
