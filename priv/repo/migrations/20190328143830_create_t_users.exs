defmodule Xcms.Repo.Migrations.CreateTUsers do
  use Ecto.Migration

  def change do
    create table(:t_users) do
      add :nick, :string, default: "", null: false
      add :mail, :string, default: "", null: false
      add :pass_hash, :string, default: "", null: false
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:t_users, [:nick])
    create unique_index(:t_users, [:mail])
  end
end
