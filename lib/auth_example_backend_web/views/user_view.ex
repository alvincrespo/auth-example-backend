defmodule AuthExampleBackendWeb.UserView do
  use AuthExampleBackendWeb, :view
  use JaSerializer.PhoenixView

  attributes [:email]

  def type(_user, _conn), do: "users"
end
