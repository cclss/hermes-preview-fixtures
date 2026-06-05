defmodule PhxStrict.Repo do
  use Ecto.Repo,
    otp_app: :phx_strict,
    adapter: Ecto.Adapters.Postgres
end
