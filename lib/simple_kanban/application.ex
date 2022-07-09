defmodule SimpleKanban.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SimpleKanban.Repo,
      # Start the Telemetry supervisor
      SimpleKanbanWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SimpleKanban.PubSub},
      # Start the Endpoint (http/https)
      SimpleKanbanWeb.Endpoint
      # Start a worker by calling: SimpleKanban.Worker.start_link(arg)
      # {SimpleKanban.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleKanban.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SimpleKanbanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
