defmodule Xcms.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "t_posts" do
    field :body, :string
    field :cover, :string
    field :published, :boolean, default: false
    field :slug, :string
    field :title, :string
    field :uid, :integer

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :cover, :slug, :published, :uid])
    |> validate_required([:title, :body, :cover, :slug, :published, :uid])
  end
end
