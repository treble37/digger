defmodule Digger.Mixfile do
  use Mix.Project

  @version "3.1.0"
  @source_url "https://github.com/treble37/digger"

  def project do
    [
      app: :digger,
      version: @version,
      elixir: ">= 1.12.0",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      extras: [
        "README.md",
        "CHANGELOG.md",
        "guides/phoenix_js_bridge.md"
      ],
      groups_for_extras: [
        Recipes: ~r{guides/}
      ]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Bruce Park"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => "https://hexdocs.pm/digger/changelog.html",
        "Docs" => "https://hexdocs.pm/digger"
      }
    ]
  end

  defp description do
    """
    A collection of helpers to operate on nested maps. See README for the complete list of helpers.
    The test suite is also helpful.
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.40.3", only: :dev},
      {:excoveralls, "~> 0.18.5", only: :test},
      {:credo, "~> 1.7.0", only: [:dev, :test]}
    ]
  end
end
