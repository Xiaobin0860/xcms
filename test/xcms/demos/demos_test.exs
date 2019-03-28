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

  describe "jusers" do
    alias Xcms.Demos.JUser

    @valid_attrs %{age: 42, name: "some name"}
    @update_attrs %{age: 43, name: "some updated name"}
    @invalid_attrs %{age: nil, name: nil}

    def j_user_fixture(attrs \\ %{}) do
      {:ok, j_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Demos.create_j_user()

      j_user
    end

    test "list_jusers/0 returns all jusers" do
      j_user = j_user_fixture()
      assert Demos.list_jusers() == [j_user]
    end

    test "get_j_user!/1 returns the j_user with given id" do
      j_user = j_user_fixture()
      assert Demos.get_j_user!(j_user.id) == j_user
    end

    test "create_j_user/1 with valid data creates a j_user" do
      assert {:ok, %JUser{} = j_user} = Demos.create_j_user(@valid_attrs)
      assert j_user.age == 42
      assert j_user.name == "some name"
    end

    test "create_j_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Demos.create_j_user(@invalid_attrs)
    end

    test "update_j_user/2 with valid data updates the j_user" do
      j_user = j_user_fixture()
      assert {:ok, %JUser{} = j_user} = Demos.update_j_user(j_user, @update_attrs)
      assert j_user.age == 43
      assert j_user.name == "some updated name"
    end

    test "update_j_user/2 with invalid data returns error changeset" do
      j_user = j_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Demos.update_j_user(j_user, @invalid_attrs)
      assert j_user == Demos.get_j_user!(j_user.id)
    end

    test "delete_j_user/1 deletes the j_user" do
      j_user = j_user_fixture()
      assert {:ok, %JUser{}} = Demos.delete_j_user(j_user)
      assert_raise Ecto.NoResultsError, fn -> Demos.get_j_user!(j_user.id) end
    end

    test "change_j_user/1 returns a j_user changeset" do
      j_user = j_user_fixture()
      assert %Ecto.Changeset{} = Demos.change_j_user(j_user)
    end
  end
end
