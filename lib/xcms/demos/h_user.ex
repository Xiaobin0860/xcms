defmodule Xcms.Demos.HUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "t_husers" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(h_user, attrs) do
    h_user
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
