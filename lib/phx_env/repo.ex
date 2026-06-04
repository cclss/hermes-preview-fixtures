defmodule PhxEnv.Repo do
  use Ecto.Repo,
    otp_app: :phx_env,
    adapter: Ecto.Adapters.Postgres
end
