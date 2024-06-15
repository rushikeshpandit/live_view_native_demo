defmodule NativeDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NativeDemoWeb.Telemetry,
      NativeDemo.Repo,
      {DNSCluster, query: Application.get_env(:native_demo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: NativeDemo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: NativeDemo.Finch},
      # Start a worker by calling: NativeDemo.Worker.start_link(arg)
      # {NativeDemo.Worker, arg},
      # Start to serve requests, typically the last entry
      NativeDemoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NativeDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NativeDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
