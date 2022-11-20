defmodule Todolist.TimeManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.TimeManager` context.
  """

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        teamname: "some teamname"
      })
      |> Todolist.TimeManager.create_team()

    team
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password",
        rank: "some rank",
        username: "some username"
      })
      |> Todolist.TimeManager.create_user()

    user
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2022-10-26 08:45:00]
      })
      |> Todolist.TimeManager.create_clock()

    clock
  end

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~N[2022-10-26 08:45:00],
        start: ~N[2022-10-26 08:45:00]
      })
      |> Todolist.TimeManager.create_workingtime()

    workingtime
  end

  @doc """
  Generate a association__user.
  """
  def association__user_fixture(attrs \\ %{}) do
    {:ok, association__user} =
      attrs
      |> Enum.into(%{

      })
      |> Todolist.TimeManager.create_association__user()

    association__user
  end
end
