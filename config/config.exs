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

# Cipher
config :cipher,
  keyphrase: "+R0YfDgxAqnAaWaryEwaKgaJXYQuTMdnZx1PAIY9e/pa4xMZ+X1yUcGPO1PgHCAo",
  ivphrase: "XcR+eDz2n0yqv3lqUuL7+xFNSuB1UzSLlYB508Jezw7l9XF0T5eYXGqPTmnFljIa",
  magic_token: "TCutmX7lg6vFXLeTyztcszOGSqGt7jVvdA2kjNIGmozBXpv4YgjFBs8DJGb9egXi"

# Redis
config :moneybear, :redis, url: "redis://localhost:6379/10"

# SLime

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine,
  # If you want to use LiveView
  slimleex: PhoenixSlime.LiveViewEngine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
