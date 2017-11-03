defmodule AuthExampleBackendWeb.Router do
  use AuthExampleBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AuthExampleBackendWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
