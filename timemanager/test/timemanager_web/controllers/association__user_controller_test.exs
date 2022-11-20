defmodule TodolistWeb.Association_UserControllerTest do
  use TodolistWeb.ConnCase

  import Todolist.TimeManagerFixtures

  alias Todolist.TimeManager.Association_User

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all association_users", %{conn: conn} do
      conn = get(conn, Routes.association__user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create association__user" do
    test "renders association__user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.association__user_path(conn, :create), association__user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.association__user_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.association__user_path(conn, :create), association__user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update association__user" do
    setup [:create_association__user]

    test "renders association__user when data is valid", %{conn: conn, association__user: %Association_User{id: id} = association__user} do
      conn = put(conn, Routes.association__user_path(conn, :update, association__user), association__user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.association__user_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, association__user: association__user} do
      conn = put(conn, Routes.association__user_path(conn, :update, association__user), association__user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete association__user" do
    setup [:create_association__user]

    test "deletes chosen association__user", %{conn: conn, association__user: association__user} do
      conn = delete(conn, Routes.association__user_path(conn, :delete, association__user))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.association__user_path(conn, :show, association__user))
      end
    end
  end

  defp create_association__user(_) do
    association__user = association__user_fixture()
    %{association__user: association__user}
  end
end
