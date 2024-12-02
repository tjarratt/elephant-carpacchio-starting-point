defmodule ElephantCarpacchio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElephantCarpacchioWeb.Telemetry,
      ElephantCarpacchio.Repo,
      {DNSCluster,
       query: Application.get_env(:elephant_carpacchio, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElephantCarpacchio.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ElephantCarpacchio.Finch},
      # Start a worker by calling: ElephantCarpacchio.Worker.start_link(arg)
      # {ElephantCarpacchio.Worker, arg},
      # Start to serve requests, typically the last entry
      ElephantCarpacchioWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElephantCarpacchio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElephantCarpacchioWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
