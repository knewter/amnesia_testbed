defmodule AmnesiaTestbed.Mixfile do
  use Mix.Project

  def project do
    [ app: :amnesia_testbed,
      version: "0.0.1",
      elixir: "~> 0.10.3-dev",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    []
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      {:amnesia, "~> 0.1.0", git: "https://github.com/meh/amnesia.git" }
    ]
  end
end
