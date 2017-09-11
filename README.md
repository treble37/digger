# NestedAtomizer

## The Problem

You have a nested map (or a struct that you converted to a nested map) with keys that are not atoms and you want to convert those keys to atoms. Typically, I've had this issue with maps with string keys.

## The Solution: NestedAtomizer

NestedAtomizer drills down into a nested map and converts keys which are not atoms into atoms.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `nested_atomizer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:nested_atomizer, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/nested_atomizer](https://hexdocs.pm/nested_atomizer).

