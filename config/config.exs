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
  render_errors: [view: AuthExampleBackendWeb.ErrorView, accepts: ~w(json-api)],
  pubsub: [name: AuthExampleBackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configuration from ja_serializer
# Reference: https://github.com/vt-elixir/ja_serializer#configuration
config :phoenix, :format_encoders,
  "json-api": Poison

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

config :auth_example_backend, AuthExampleBackend.Auth.Guardian,
       issuer: "auth_example_backend",
       secret_key: "Secret key. You can use `mix guardian.gen.secret` to get one"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
