defmodule PhxToml.Repo do
  use Ecto.Repo,
    otp_app: :phx_toml,
    adapter: Ecto.Adapters.Postgres
end
