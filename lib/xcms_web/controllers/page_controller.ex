defmodule XcmsWeb.PageController do
  use XcmsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
