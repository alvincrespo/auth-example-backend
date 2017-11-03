defmodule AuthExampleBackend.ActorsTest do
  use AuthExampleBackend.DataCase

  alias AuthExampleBackend.Actors

  describe "users" do
    alias AuthExampleBackend.Actors.User

    @valid_attrs %{email: "some email", password: "some password", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", password: "some updated password", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, password: nil, password_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Actors.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Actors.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Actors.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Actors.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Actors.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Actors.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Actors.update_user(user, @invalid_attrs)
      assert user == Actors.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Actors.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Actors.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Actors.change_user(user)
    end
  end
end
