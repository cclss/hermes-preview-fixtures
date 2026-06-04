defmodule PhxEnv.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhxEnvWeb.Telemetry,
      PhxEnv.Repo,
      {DNSCluster, query: Application.get_env(:phx_env, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhxEnv.PubSub},
      # Start a worker by calling: PhxEnv.Worker.start_link(arg)
      # {PhxEnv.Worker, arg},
      # Start to serve requests, typically the last entry
      PhxEnvWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxEnv.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxEnvWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
