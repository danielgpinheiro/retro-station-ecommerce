defmodule RetroStation.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RetroStationWeb.Telemetry,
      RetroStation.Repo,
      {DNSCluster, query: Application.get_env(:retro_station, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RetroStation.PubSub},
      # Start a worker by calling: RetroStation.Worker.start_link(arg)
      # {RetroStation.Worker, arg},
      # Start to serve requests, typically the last entry
      RetroStationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RetroStation.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RetroStationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
