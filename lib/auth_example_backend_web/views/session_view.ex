defmodule AuthExampleBackendWeb.SessionView do
  use AuthExampleBackendWeb, :view

  def render("token.json", %{token: token, user: user}) do
    %{access_token: token, user_id: user.id}
  end

  def render("login_failed.json", _) do
    %{errors: ["Invalid username/password combination!"]}
  end
end
