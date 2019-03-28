defmodule Xcms.Repo.Migrations.CreateTUsers do
  use Ecto.Migration

  def change do
    create table(:t_users) do
      add :nick, :string
      add :mail, :string
      add :pass_hash, :string
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:t_users, [:nick])
    create unique_index(:t_users, [:mail])
  end
end
