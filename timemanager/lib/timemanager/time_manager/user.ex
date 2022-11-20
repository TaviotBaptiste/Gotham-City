defmodule Todolist.TimeManager.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password, :string
    field :rank, :string
    field :username, :string
    has_many :teams, Todolist.TimeManager.Team
    has_one :clocks, Todolist.TimeManager.Clock
    has_many :workingtimes, Todolist.TimeManager.Workingtime

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :rank])
    |> validate_required([:username, :email, :password, :rank])
    |> validate_format(:email, ~r/^[\w-.]+@([\w-]+.)+[\w-]{2,4}$/)
    |> hash_password
  end


  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} -> put_change(changeset, :password, Pbkdf2.hash_pwd_salt(password))
      _ -> changeset
    end
  end
end
