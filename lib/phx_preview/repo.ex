defmodule PhxPreview.Repo do
  use Ecto.Repo,
    otp_app: :phx_preview,
    adapter: Ecto.Adapters.Postgres
end
