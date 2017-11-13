defmodule AuthExampleBackendWeb.SessionController do
  use AuthExampleBackendWeb, :controller

  alias Comeonin.Bcrypt
  alias AuthExampleBackend.Actors
  alias AuthExampleBackend.Auth.Guardian.Plug, as: Gplug

  def create(conn, %{"username" => email, "password" => password, "grant_type" => "password"}) do
    case Actors.get_user_by(%{email: email}) do
      nil ->
        Bcrypt.dummy_checkpw
        login_failed(conn)
      user ->
        if Bcrypt.checkpw(password, user.password_hash) do
          conn = conn |> Gplug.sign_in(user, %{})
          token = conn |> Gplug.current_token

          conn
          |> put_resp_header("authorization", "Bearer #{token}")
          |> render("token.json", %{token: token, user: user})
        else
          login_failed(conn)
        end
    end
  end

  defp login_failed(conn) do
    conn
    |> put_status(422)
    |> render("login_failed.json", %{})
  end
end
