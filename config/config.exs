# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auth_example_backend,
  ecto_repos: [AuthExampleBackend.Repo]

# Configures the endpoint
config :auth_example_backend, AuthExampleBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LaWeMkctiWd9RJYAe6aL4bwgGSjBc8qVHcv74wFtKCP2+a4Ip7nOYEtUNj5P2HNu",
  render_errors: [view: AuthExampleBackendWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AuthExampleBackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"