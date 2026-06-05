defmodule PhxEnvReqEcto.Repo do
  use Ecto.Repo,
    otp_app: :phx_env_req_ecto,
    adapter: Ecto.Adapters.Postgres
end
