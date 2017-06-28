defmodule ElixirServer.Mixfile do
  use Mix.Project

  def project do
    [app: :logger_server,
      version: "0.1.0",
      deps: deps()]
  end

  def application do
    [mod: {LoggerServer, []},
      applications: [:logger]
    ]
  end
  def deps do
    [
      {:distillery, "~> 1.4"}
    ]
  end
end
