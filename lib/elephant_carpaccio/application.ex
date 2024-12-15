defmodule ElephantCarpaccio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElephantCarpaccioWeb.Telemetry,
      {DNSCluster,
       query: Application.get_env(:elephant_carpaccio, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElephantCarpaccio.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ElephantCarpaccio.Finch},
      # Start a worker by calling: ElephantCarpaccio.Worker.start_link(arg)
      # {ElephantCarpaccio.Worker, arg},
      # Start to serve requests, typically the last entry
      ElephantCarpaccioWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElephantCarpaccio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElephantCarpaccioWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
