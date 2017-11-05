defmodule AuthExampleBackendWeb.UserController do
  use AuthExampleBackendWeb, :controller

  alias AuthExampleBackend.Actors
  alias AuthExampleBackend.Actors.User

  action_fallback AuthExampleBackendWeb.FallbackController

  def index(conn, _params) do
    users = Actors.list_users()
    render(conn, "index.json-api", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Actors.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json-api", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Actors.get_user!(id)
    render(conn, "show.json-api", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Actors.get_user!(id)

    with {:ok, %User{} = user} <- Actors.update_user(user, user_params) do
      render(conn, "show.json-api", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Actors.get_user!(id)
    with {:ok, %User{}} <- Actors.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
