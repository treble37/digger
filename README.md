# Digger

## Description

Digger is a collection of helpers to help you operate on nested maps (it will also work on non-nested maps). Elixir gives you a great collection of map methods, but sometimes I find myself having to rewrite the same operations specifically for nested maps.

This library is intended to help your code stay [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

## Possible Future Work

This library is a work in progress. I'm thinking about extending it to lists and/or tuples.

## Here is a list of helper modules/methods Digger gives you:

## 1 - Digger.Atomizer

### The Problem

You have a nested map (or a struct that you converted to a nested map) with keys that are not atoms and you want to convert those keys to atoms. Typically, I've had this issue with maps with string keys.

### The Solution: Digger.Atomizer

Digger.Atomizer drills down into a nested map and converts keys which are not atoms into atoms.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `digger` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:digger, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/digger](https://hexdocs.pm/digger).

