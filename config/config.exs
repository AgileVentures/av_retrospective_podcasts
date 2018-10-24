# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :av_retrospective_podcasts,
  ecto_repos: [AvRetrospectivePodcasts.Repo]

# Configures the endpoint
config :av_retrospective_podcasts, AvRetrospectivePodcastsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/Zf+GZPHZVSEZcDlxXjp2mHNFr4sMf6/sleKjsEIApurTIyCSlrg1h8QnclPNvb+",
  render_errors: [view: AvRetrospectivePodcastsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AvRetrospectivePodcasts.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
