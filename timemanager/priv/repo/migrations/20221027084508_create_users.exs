defmodule Todolist.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false
      add :rank, :string, null: false
      add :team_id, references(:teams, on_delete: :nothing), null: true

      timestamps()
    end

    create index(:users, [:team_id])
  end
end
