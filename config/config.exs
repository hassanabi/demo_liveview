# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :demo_liveview,
  ecto_repos: [DemoLiveview.Repo]

# Configures the endpoint
config :demo_liveview, DemoLiveviewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O4pQEZ+/6t+MwiglCfJJMPFbcTt9gG9Pkivt6pEC/bJ/rtC50r24uOOIX5iAD1Pr",
  render_errors: [view: DemoLiveviewWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DemoLiveview.PubSub,
  live_view: [signing_salt: "suEM69QH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
