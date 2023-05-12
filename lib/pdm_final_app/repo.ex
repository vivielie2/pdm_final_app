defmodule PdmFinalApp.Repo do
  use Ecto.Repo,
    otp_app: :pdm_final_app,
    adapter: Ecto.Adapters.Postgres
end
