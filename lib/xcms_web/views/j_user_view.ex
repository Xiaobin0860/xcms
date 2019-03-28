defmodule XcmsWeb.JUserView do
  use XcmsWeb, :view
  alias XcmsWeb.JUserView

  def render("index.json", %{jusers: jusers}) do
    %{data: render_many(jusers, JUserView, "j_user.json")}
  end

  def render("show.json", %{j_user: j_user}) do
    %{data: render_one(j_user, JUserView, "j_user.json")}
  end

  def render("j_user.json", %{j_user: j_user}) do
    %{id: j_user.id,
      name: j_user.name,
      age: j_user.age}
  end
end
