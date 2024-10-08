# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :plummy_api,
  ecto_repos: [PlummyApi.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true]

# Configures the endpoint
config :plummy_api, PlummyApiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: PlummyApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: PlummyApi.PubSub,
  live_view: [signing_salt: "XxQGvgyz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :plummy_api, PlummyApiWeb.Auth.Guardian,
  issuer: "plummy_api",
  secret_key: System.get_env("GUARDIAN_SECRET_KEY")

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :guardian, Guardian.DB,
  repo: PlummyApi.Repo,
  schema_name: "guardian_tokens",
  sweep_interval: 60

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
