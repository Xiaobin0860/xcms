defmodule XcmsWeb.JUserController do
  use XcmsWeb, :controller

  alias Xcms.Demos
  alias Xcms.Demos.JUser

  action_fallback XcmsWeb.FallbackController

  def index(conn, _params) do
    jusers = Demos.list_jusers()
    render(conn, "index.json", jusers: jusers)
  end

  def create(conn, %{"j_user" => j_user_params}) do
    with {:ok, %JUser{} = j_user} <- Demos.create_j_user(j_user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.j_user_path(conn, :show, j_user))
      |> render("show.json", j_user: j_user)
    end
  end

  def show(conn, %{"id" => id}) do
    j_user = Demos.get_j_user!(id)
    render(conn, "show.json", j_user: j_user)
  end

  def update(conn, %{"id" => id, "j_user" => j_user_params}) do
    j_user = Demos.get_j_user!(id)

    with {:ok, %JUser{} = j_user} <- Demos.update_j_user(j_user, j_user_params) do
      render(conn, "show.json", j_user: j_user)
    end
  end

  def delete(conn, %{"id" => id}) do
    j_user = Demos.get_j_user!(id)

    with {:ok, %JUser{}} <- Demos.delete_j_user(j_user) do
      send_resp(conn, :no_content, "")
    end
  end
end
