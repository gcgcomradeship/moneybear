# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :moneybear,
  ecto_repos: [Moneybear.Repo]

# Configures the endpoint
config :moneybear, MoneybearWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZTqn62umTBAAabf+SoPHTeaWwoklN8UjY/wRNKjujqAERbKzgAnOZZkgOJkFn6U1",
  render_errors: [view: MoneybearWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Moneybear.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "HTDJHTFKHTFKHFKHFGKHF"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# SLime

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine,
  # If you want to use LiveView
  slimleex: PhoenixSlime.LiveViewEngine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
