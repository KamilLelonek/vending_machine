defmodule VendingMachine.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args),
    do: Supervisor.start_link(children(), opts())

  defp opts do
    [
      strategy: :one_for_one,
      name: VendingMachine.Supervisor
    ]
  end

  defp children, do: []
end
