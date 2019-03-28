defmodule XcmsWeb.HUserController do
  use XcmsWeb, :controller

  alias Xcms.Demos
  alias Xcms.Demos.HUser

  def index(conn, _params) do
    husers = Demos.list_husers()
    render(conn, "index.html", husers: husers)
  end

  def new(conn, _params) do
    changeset = Demos.change_h_user(%HUser{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"h_user" => h_user_params}) do
    case Demos.create_h_user(h_user_params) do
      {:ok, h_user} ->
        conn
        |> put_flash(:info, "H user created successfully.")
        |> redirect(to: Routes.h_user_path(conn, :show, h_user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    h_user = Demos.get_h_user!(id)
    render(conn, "show.html", h_user: h_user)
  end

  def edit(conn, %{"id" => id}) do
    h_user = Demos.get_h_user!(id)
    changeset = Demos.change_h_user(h_user)
    render(conn, "edit.html", h_user: h_user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "h_user" => h_user_params}) do
    h_user = Demos.get_h_user!(id)

    case Demos.update_h_user(h_user, h_user_params) do
      {:ok, h_user} ->
        conn
        |> put_flash(:info, "H user updated successfully.")
        |> redirect(to: Routes.h_user_path(conn, :show, h_user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", h_user: h_user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    h_user = Demos.get_h_user!(id)
    {:ok, _h_user} = Demos.delete_h_user(h_user)

    conn
    |> put_flash(:info, "H user deleted successfully.")
    |> redirect(to: Routes.h_user_path(conn, :index))
  end
end
