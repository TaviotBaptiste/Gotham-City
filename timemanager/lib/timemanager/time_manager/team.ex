defmodule Todolist.TimeManager.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :teamname, :string
    has_many :user, Todolist.TimeManager.User

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:teamname])
    |> validate_required([:teamname])
  end
end
