defmodule TodolistWeb.WorkingtimeController do
  use TodolistWeb, :controller

  alias Todolist.TimeManager
  alias Todolist.TimeManager.Workingtime

  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do
    workingtimes = TimeManager.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- TimeManager.create_workingtime(workingtime_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = TimeManager.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = TimeManager.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- TimeManager.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = TimeManager.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- TimeManager.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
