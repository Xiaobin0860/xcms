defmodule XcmsWeb.JUserControllerTest do
  use XcmsWeb.ConnCase

  alias Xcms.Demos
  alias Xcms.Demos.JUser

  @create_attrs %{
    age: 42,
    name: "some name"
  }
  @update_attrs %{
    age: 43,
    name: "some updated name"
  }
  @invalid_attrs %{age: nil, name: nil}

  def fixture(:j_user) do
    {:ok, j_user} = Demos.create_j_user(@create_attrs)
    j_user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all jusers", %{conn: conn} do
      conn = get(conn, Routes.j_user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create j_user" do
    test "renders j_user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.j_user_path(conn, :create), j_user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.j_user_path(conn, :show, id))

      assert %{
               "id" => id,
               "age" => 42,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.j_user_path(conn, :create), j_user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update j_user" do
    setup [:create_j_user]

    test "renders j_user when data is valid", %{conn: conn, j_user: %JUser{id: id} = j_user} do
      conn = put(conn, Routes.j_user_path(conn, :update, j_user), j_user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.j_user_path(conn, :show, id))

      assert %{
               "id" => id,
               "age" => 43,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, j_user: j_user} do
      conn = put(conn, Routes.j_user_path(conn, :update, j_user), j_user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete j_user" do
    setup [:create_j_user]

    test "deletes chosen j_user", %{conn: conn, j_user: j_user} do
      conn = delete(conn, Routes.j_user_path(conn, :delete, j_user))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.j_user_path(conn, :show, j_user))
      end
    end
  end

  defp create_j_user(_) do
    j_user = fixture(:j_user)
    {:ok, j_user: j_user}
  end
end
