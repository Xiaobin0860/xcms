defmodule Xcms.Demos.JUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "t_jusers" do
    field :age, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(j_user, attrs) do
    j_user
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
    |> unique_constraint(:name)
  end
end
