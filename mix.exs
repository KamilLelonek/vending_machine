defmodule VendingMachine.MixProject do
  use Mix.Project

  def project do
    [
      app: :vending_machine,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {VendingMachine.Application, []}
    ]
  end

  defp deps do
    [
      {:decimal, "~> 2.0"}
    ]
  end
end
