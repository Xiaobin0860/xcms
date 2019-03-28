defmodule Xcms.Repo.Migrations.CreateTPosts do
  use Ecto.Migration

  def change do
    create table(:t_posts) do
      add :title, :string, default: "", null: false
      add :body, :string, default: "", null: false
      add :cover, :string, default: "", null: false
      add :slug, :string, default: "", null: false
      add :published, :boolean, default: false, null: false
      add :uid, :integer, default: 0, null: false

      timestamps()
    end

  end
end
