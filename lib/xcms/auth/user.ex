defmodule Xcms.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "t_users" do
    field :is_admin, :boolean, default: false
    field :mail, :string
    field :nick, :string
    field :pass_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nick, :mail, :pass_hash, :is_admin])
    |> validate_required([:nick, :mail, :pass_hash, :is_admin])
    |> unique_constraint(:nick)
    |> unique_constraint(:mail)
  end
end
