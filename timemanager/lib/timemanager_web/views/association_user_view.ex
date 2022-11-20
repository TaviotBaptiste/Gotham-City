defmodule TodolistWeb.Association_UserView do
  use TodolistWeb, :view
  alias TodolistWeb.Association_UserView

  def render("index.json", %{association_users: association_users}) do
    %{data: render_many(association_users, Association_UserView, "association_user.json")}
  end

  def render("show.json", %{association_user: association_user}) do
    %{data: render_one(association_user, Association_UserView, "association_user.json")}
  end

  def render("association_user.json", %{association_user: association_user}) do
    %{
      id: association_user.id
    }
  end
end
