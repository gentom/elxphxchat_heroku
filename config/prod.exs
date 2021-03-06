use Mix.Config

config :elxphxchat, ElxphxchatWeb.Endpoint,
  load_from_system_env: true,
  # url: [host: "example.com", port: 80],
  url: [scheme: "https", host: "boiling-savannah-70827.herokuapp.com", port: 443], 
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

# config your DB
config :elxphxchat, Elxphxchat.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true
