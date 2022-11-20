defmodule TodolistWeb.UserController do
  require Logger
  use TodolistWeb, :controller

  alias Todolist.TimeManager
  alias Todolist.TimeManager.User

  action_fallback(TodolistWeb.FallbackController)

  def index(conn, _params) do
    users = TimeManager.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- TimeManager.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = TimeManager.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = TimeManager.get_user!(id)

    with {:ok, %User{} = user} <- TimeManager.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = TimeManager.get_user!(id)

    with {:ok, %User{}} <- TimeManager.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def login(conn, %{"email" => email, "password" => password}) do
    with %User{} = user <- TimeManager.get_user_by_email(email),
         true <- Pbkdf2.verify_pass(password, user.password) do
      {:ok, token, _claims} = Todolist.Guardian.encode_and_sign(user)
      conn |> render("login.json", %{token: token})
    else
      _ ->
        conn
        |> render("error.json", %{code: 400, title: "forbidden", message: "Invalid credential."})
    end
  end

  def token(conn, _params) do
    token = conn.private.guardian_default_token
    {:ok, claims} = Todolist.Guardian.decode_and_verify(token)
    user = TimeManager.get_user!(claims["sub"])
    conn |> render("show.json", %{user: user})
  end
end
