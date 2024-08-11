defmodule PlummyApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PlummyApiWeb.Telemetry,
      PlummyApi.Repo,
      {DNSCluster, query: Application.get_env(:plummy_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PlummyApi.PubSub},
      # Start a worker by calling: PlummyApi.Worker.start_link(arg)
      # {PlummyApi.Worker, arg},
      # Start to serve requests, typically the last entry
      PlummyApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlummyApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PlummyApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
