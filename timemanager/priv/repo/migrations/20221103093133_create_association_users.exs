defmodule Todolist.Repo.Migrations.CreateAssociationUsers do
  use Ecto.Migration

  def change do
    create table(:association_users) do
      add :team, references(:teams, on_delete: :nothing, null: false)
      add :user, references(:users, on_delete: :nothing, null: false)

      timestamps()
    end

    create index(:association_users, [:team])
    create index(:association_users, [:user])
  end
end
