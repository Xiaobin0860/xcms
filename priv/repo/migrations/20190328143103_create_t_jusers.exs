defmodule Xcms.Repo.Migrations.CreateTJusers do
  use Ecto.Migration

  def change do
    create table(:t_jusers) do
      add :name, :string, default: "", null: false
      add :age, :integer, default: 0, null: false

      timestamps()
    end

    create unique_index(:t_jusers, [:name])
  end
end
