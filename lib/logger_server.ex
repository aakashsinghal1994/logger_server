defmodule LoggerServer do
  use Supervisor
  require Logger

  def start(_type, _args) do
    Logger.info "Starting elixir Server"
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    Logger.info "Initilizing"
    children = [
      worker(Helper, [])
    ]
    supervise(children, strategy: :one_for_one)
  end
end
