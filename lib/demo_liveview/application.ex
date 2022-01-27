defmodule DemoLiveview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DemoLiveview.Repo,
      # Start the Telemetry supervisor
      DemoLiveviewWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DemoLiveview.PubSub},
      # Start the Endpoint (http/https)
      DemoLiveviewWeb.Endpoint
      # Start a worker by calling: DemoLiveview.Worker.start_link(arg)
      # {DemoLiveview.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DemoLiveview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DemoLiveviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
