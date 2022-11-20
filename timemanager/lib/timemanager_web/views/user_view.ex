defmodule TodolistWeb.UserView do
  use TodolistWeb, :view
  alias TodolistWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      password: user.password,
      rank: user.rank
    }
  end

  def render("login.json", %{token: token}) do
    %{token: token}
  end

  def render("error.json", %{code: code, title: title, message: message}) do
    %{code: code, title: title, message: message}
  end
end
