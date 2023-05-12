import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :pdm_final_app, PdmFinalApp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "pdm_final_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pdm_final_app, PdmFinalAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "se5GjDdmvloYDnQa2XqoZPuSOvp3au9e/Cn94cB2KH8Bwg3njaHJV6YVlZ+/btYM",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
