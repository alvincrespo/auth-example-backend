defmodule AuthExampleBackendWeb.ErrorView do
  use AuthExampleBackendWeb, :view
  use JaSerializer.PhoenixView

  def render("404.json-api", _assigns) do
    %{errors: %{detail: "Page not found"}}
  end

  def render("500.json-api", _assigns) do
    %{errors: %{detail: "Internal server error"}}
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.json-api", assigns
  end
end
