defmodule Todolist.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :teamname, :string, null: false

      timestamps()
    end
  end
end
