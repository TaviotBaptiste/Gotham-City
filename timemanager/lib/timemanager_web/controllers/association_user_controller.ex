defmodule TodolistWeb.Association_UserController do
  use TodolistWeb, :controller

  alias Todolist.TimeManager
  alias Todolist.TimeManager.Association_User

  action_fallback(TodolistWeb.FallbackController)

  def index(conn, _params) do
    association_users = TimeManager.list_association_users()
    render(conn, "index.json", association_users: association_users)
  end

  def create(conn, %{"association_user" => association_user_params}) do
    with {:ok, %Association_User{} = association_user} <-
           TimeManager.create_association_user(association_user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.association_user_path(conn, :show, association_user))
      |> render("create.json",
        association_user: %{
          id: association_user.id,
          team_id: association_user_params["teams_id"],
          users_id: association_user_params["users_id"]
        }
      )
    end
  end

  def show(conn, %{"id" => id}) do
    association_user = TimeManager.get_association_user!(id)
    render(conn, "show.json", association_user: association_user)
  end

  def update(conn, %{"id" => id, "association_user" => association_user_params}) do
    association_user = TimeManager.get_association_user!(id)

    with {:ok, %Association_User{} = association_user} <-
           TimeManager.update_association_user(association_user, association_user_params) do
      render(conn, "show.json", association_user: association_user)
    end
  end

  def delete(conn, %{"id" => id}) do
    association_user = TimeManager.get_association_user!(id)

    with {:ok, %Association_User{}} <- TimeManager.delete_association_user(association_user) do
      send_resp(conn, :no_content, "")
    end
  end
end
