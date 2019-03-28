defmodule Xcms.Repo.Migrations.CreateTHusers do
  use Ecto.Migration

  def change do
    create table(:t_husers) do
      add :name, :string, default: "", null: false

      timestamps()
    end

    create unique_index(:t_husers, [:name])
  end
end
