defmodule Todolist.TimeManager.Association_User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "association_users" do
    belongs_to :teams, Todolist.TimeManager.Team
    belongs_to :users, Todolist.TimeManager.User
    timestamps()
  end

  @doc false
  def changeset(association_user, attrs) do
    association_user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
