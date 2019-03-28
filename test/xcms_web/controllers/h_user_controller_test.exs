defmodule XcmsWeb.HUserControllerTest do
  use XcmsWeb.ConnCase

  alias Xcms.Demos

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:h_user) do
    {:ok, h_user} = Demos.create_h_user(@create_attrs)
    h_user
  end

  describe "index" do
    test "lists all husers", %{conn: conn} do
      conn = get(conn, Routes.h_user_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Husers"
    end
  end

  describe "new h_user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.h_user_path(conn, :new))
      assert html_response(conn, 200) =~ "New H user"
    end
  end

  describe "create h_user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.h_user_path(conn, :create), h_user: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.h_user_path(conn, :show, id)

      conn = get(conn, Routes.h_user_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show H user"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.h_user_path(conn, :create), h_user: @invalid_attrs)
      assert html_response(conn, 200) =~ "New H user"
    end
  end

  describe "edit h_user" do
    setup [:create_h_user]

    test "renders form for editing chosen h_user", %{conn: conn, h_user: h_user} do
      conn = get(conn, Routes.h_user_path(conn, :edit, h_user))
      assert html_response(conn, 200) =~ "Edit H user"
    end
  end

  describe "update h_user" do
    setup [:create_h_user]

    test "redirects when data is valid", %{conn: conn, h_user: h_user} do
      conn = put(conn, Routes.h_user_path(conn, :update, h_user), h_user: @update_attrs)
      assert redirected_to(conn) == Routes.h_user_path(conn, :show, h_user)

      conn = get(conn, Routes.h_user_path(conn, :show, h_user))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, h_user: h_user} do
      conn = put(conn, Routes.h_user_path(conn, :update, h_user), h_user: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit H user"
    end
  end

  describe "delete h_user" do
    setup [:create_h_user]

    test "deletes chosen h_user", %{conn: conn, h_user: h_user} do
      conn = delete(conn, Routes.h_user_path(conn, :delete, h_user))
      assert redirected_to(conn) == Routes.h_user_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.h_user_path(conn, :show, h_user))
      end
    end
  end

  defp create_h_user(_) do
    h_user = fixture(:h_user)
    {:ok, h_user: h_user}
  end
end
