defmodule Todolist.TimeManagerTest do
  use Todolist.DataCase

  alias Todolist.TimeManager

  describe "teams" do
    alias Todolist.TimeManager.Team

    import Todolist.TimeManagerFixtures

    @invalid_attrs %{teamname: nil}

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert TimeManager.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert TimeManager.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{teamname: "some teamname"}

      assert {:ok, %Team{} = team} = TimeManager.create_team(valid_attrs)
      assert team.teamname == "some teamname"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      update_attrs = %{teamname: "some updated teamname"}

      assert {:ok, %Team{} = team} = TimeManager.update_team(team, update_attrs)
      assert team.teamname == "some updated teamname"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_team(team, @invalid_attrs)
      assert team == TimeManager.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = TimeManager.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_team(team)
    end
  end

  describe "users" do
    alias Todolist.TimeManager.User

    import Todolist.TimeManagerFixtures

    @invalid_attrs %{email: nil, password: nil, rank: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert TimeManager.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert TimeManager.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", password: "some password", rank: "some rank", username: "some username"}

      assert {:ok, %User{} = user} = TimeManager.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.rank == "some rank"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", password: "some updated password", rank: "some updated rank", username: "some updated username"}

      assert {:ok, %User{} = user} = TimeManager.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.rank == "some updated rank"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_user(user, @invalid_attrs)
      assert user == TimeManager.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = TimeManager.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_user(user)
    end
  end

  describe "clocks" do
    alias Todolist.TimeManager.Clock

    import Todolist.TimeManagerFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert TimeManager.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert TimeManager.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      valid_attrs = %{status: true, time: ~N[2022-10-26 08:45:00]}

      assert {:ok, %Clock{} = clock} = TimeManager.create_clock(valid_attrs)
      assert clock.status == true
      assert clock.time == ~N[2022-10-26 08:45:00]
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      update_attrs = %{status: false, time: ~N[2022-10-27 08:45:00]}

      assert {:ok, %Clock{} = clock} = TimeManager.update_clock(clock, update_attrs)
      assert clock.status == false
      assert clock.time == ~N[2022-10-27 08:45:00]
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_clock(clock, @invalid_attrs)
      assert clock == TimeManager.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = TimeManager.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_clock(clock)
    end
  end

  describe "workingtimes" do
    alias Todolist.TimeManager.Workingtime

    import Todolist.TimeManagerFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtimes/0 returns all workingtimes" do
      workingtime = workingtime_fixture()
      assert TimeManager.list_workingtimes() == [workingtime]
    end

    test "get_workingtime!/1 returns the workingtime with given id" do
      workingtime = workingtime_fixture()
      assert TimeManager.get_workingtime!(workingtime.id) == workingtime
    end

    test "create_workingtime/1 with valid data creates a workingtime" do
      valid_attrs = %{end: ~N[2022-10-26 08:45:00], start: ~N[2022-10-26 08:45:00]}

      assert {:ok, %Workingtime{} = workingtime} = TimeManager.create_workingtime(valid_attrs)
      assert workingtime.end == ~N[2022-10-26 08:45:00]
      assert workingtime.start == ~N[2022-10-26 08:45:00]
    end

    test "create_workingtime/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_workingtime(@invalid_attrs)
    end

    test "update_workingtime/2 with valid data updates the workingtime" do
      workingtime = workingtime_fixture()
      update_attrs = %{end: ~N[2022-10-27 08:45:00], start: ~N[2022-10-27 08:45:00]}

      assert {:ok, %Workingtime{} = workingtime} = TimeManager.update_workingtime(workingtime, update_attrs)
      assert workingtime.end == ~N[2022-10-27 08:45:00]
      assert workingtime.start == ~N[2022-10-27 08:45:00]
    end

    test "update_workingtime/2 with invalid data returns error changeset" do
      workingtime = workingtime_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_workingtime(workingtime, @invalid_attrs)
      assert workingtime == TimeManager.get_workingtime!(workingtime.id)
    end

    test "delete_workingtime/1 deletes the workingtime" do
      workingtime = workingtime_fixture()
      assert {:ok, %Workingtime{}} = TimeManager.delete_workingtime(workingtime)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_workingtime!(workingtime.id) end
    end

    test "change_workingtime/1 returns a workingtime changeset" do
      workingtime = workingtime_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_workingtime(workingtime)
    end
  end

  describe "association_users" do
    alias Todolist.TimeManager.Association_User

    import Todolist.TimeManagerFixtures

    @invalid_attrs %{}

    test "list_association_users/0 returns all association_users" do
      association__user = association__user_fixture()
      assert TimeManager.list_association_users() == [association__user]
    end

    test "get_association__user!/1 returns the association__user with given id" do
      association__user = association__user_fixture()
      assert TimeManager.get_association__user!(association__user.id) == association__user
    end

    test "create_association__user/1 with valid data creates a association__user" do
      valid_attrs = %{}

      assert {:ok, %Association_User{} = association__user} = TimeManager.create_association__user(valid_attrs)
    end

    test "create_association__user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_association__user(@invalid_attrs)
    end

    test "update_association__user/2 with valid data updates the association__user" do
      association__user = association__user_fixture()
      update_attrs = %{}

      assert {:ok, %Association_User{} = association__user} = TimeManager.update_association__user(association__user, update_attrs)
    end

    test "update_association__user/2 with invalid data returns error changeset" do
      association__user = association__user_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_association__user(association__user, @invalid_attrs)
      assert association__user == TimeManager.get_association__user!(association__user.id)
    end

    test "delete_association__user/1 deletes the association__user" do
      association__user = association__user_fixture()
      assert {:ok, %Association_User{}} = TimeManager.delete_association__user(association__user)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_association__user!(association__user.id) end
    end

    test "change_association__user/1 returns a association__user changeset" do
      association__user = association__user_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_association__user(association__user)
    end
  end
end
