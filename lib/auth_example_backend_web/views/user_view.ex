defmodule AuthExampleBackendWeb.UserView do
  use AuthExampleBackendWeb, :view
  alias AuthExampleBackendWeb.UserView
  use JaSerializer.PhoenixView

  def render("index.json-api", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json-api", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json-api", %{user: user}) do
    %{id: user.id, email: user.email}
  end
end
