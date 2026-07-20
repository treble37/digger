# Digger

![Build](https://github.com/treble37/digger/actions/workflows/digger_ci.yml/badge.svg?branch=main)
[![Coverage Status](https://coveralls.io/repos/github/treble37/digger/badge.svg?branch=main)](https://coveralls.io/github/treble37/digger?branch=main)
[![Hex.pm](https://img.shields.io/hexpm/v/digger.svg)](https://hex.pm/packages/digger)
[![Hex.pm Downloads](https://img.shields.io/hexpm/dt/digger.svg)](https://hex.pm/packages/digger)
[![Documentation](https://img.shields.io/badge/hex-docs-blue.svg)](https://hexdocs.pm/digger)
[![GitHub stars](https://img.shields.io/github/stars/treble37/digger.svg)](https://github.com/treble37/digger/stargazers)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/treble37/digger/main/LICENSE)

Digger transforms the keys — and, when you ask, the values — of
arbitrarily nested Elixir maps: `atomize`, `stringify`, `camel_case`,
`snake_case`, `dasherize`, `lowercase_first`, `upcase_first`. Elixir's
stdlib covers flat maps well; Digger keeps your code
[DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) when the
same transform has to reach every level of a nested structure.

```elixir
Digger.atomize(%{"user" => %{"name" => "Ada", "roles" => ["admin"]}})
#=> %{user: %{name: "Ada", roles: ["admin"]}}
```

## Why Digger

- **Zero runtime dependencies.** The only deps are dev/test tooling —
  nothing is added to your production dependency tree.
- **Atom-table-safe atomization.** `Digger.atomize(map, existing: true)`
  only converts strings whose atoms already exist and passes everything
  else through unchanged — safe to run on untrusted input, since it can
  never grow the atom table.
- **Transforms values, not just keys.** Every helper accepts
  `type: :key | :value` with per-side `key_transform`/`value_transform`
  options, so the same protocol that rewrites keys can rewrite values:

  ```elixir
  Digger.snake_case(%{"config" => %{"mode" => "FooBar"}},
    type: :value, key_transform: :none, value_transform: :snake)
  #=> %{"config" => %{"mode" => "foo_bar"}}
  ```

- **Tagged tuples work out of the box.** `{:ok, payload}` and
  `{:error, payload}` shapes transform their payload while the tag stays
  untouched, so API results pipe straight in — including tuples nested
  inside maps and lists. Any other tuple shape (`{1, 2, 3}`, 3-tuples,
  `{}`) passes through unchanged, and `flatten`/`unflatten` treat all
  tuples as leaf values per their non-map contract:

  ```elixir
  Digger.camel_case({:ok, %{user_id: 1}})
  #=> {:ok, %{UserId: 1}}
  ```

- **Calendar structs are never touched.** `Date`, `DateTime`,
  `NaiveDateTime`, and `Time` values pass through every transform
  untouched — a guarantee covered by the test suite.
- **Flatten and rebuild nested maps.** `Digger.flatten/2` collapses a
  nested map into separator-joined paths (`%{"a.b" => 1}`) and
  `Digger.unflatten/2` rebuilds the nesting — handy for query params,
  ENV-style config keys, and log/CSV output:

  ```elixir
  %{user: %{address: %{city: "SF"}}} |> Digger.flatten()
  #=> %{"user.address.city" => "SF"}
  ```

## Installation

Add `digger` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:digger, "~> 3.1"}
  ]
end
```

Full documentation is at <https://hexdocs.pm/digger>.

## Recipe: camelCase JSON ⇄ snake_case Elixir

A common Phoenix API need: JavaScript clients speak camelCase, your
Elixir code speaks snake_case. Digger's functions compose into both
directions of that bridge — no adapter dependency required.

Incoming params (keys only — values are never corrupted; unknown keys
stay strings instead of allocating atoms):

```elixir
%{"userId" => 1, "displayName" => "johnDoe"}
|> Digger.snake_case()
|> Digger.atomize(existing: true)
#=> %{user_id: 1, display_name: "johnDoe"}
```

Outgoing JSON (lowerCamelCase string keys, ready for `Jason`):

```elixir
%{user_id: 1, order_items: [%{item_id: 2}]}
|> Digger.stringify()
|> Digger.camel_case(type: :key, key_transform: :lower, value_transform: :none)
#=> %{"userId" => 1, "orderItems" => [%{"itemId" => 2}]}
```

The [Phoenix/JS bridge guide](https://hexdocs.pm/digger/phoenix_js_bridge.html)
has the full recipe, including a copy-paste plug for your router
pipeline and notes on why the conversion is safe on untrusted input.

## Helper reference

## 1 - Digger.atomize/2

### The Problem

You have a valid data type that needs to be "atomized" This can be a string, number, or nested map with string keys.

### The Solution

Digger.atomize/2 drills down into a nested map and converts (most) keys which are not atoms into atoms.

### Safe atomize with `existing: true`

By default, `Digger.atomize/2` creates a new atom for every string it doesn't
already have an atom for. Atoms are never garbage collected, so calling
`atomize` on untrusted/external input (e.g. a JSON payload from a client) can
exhaust the atom table over time.

Pass `existing: true` to only atomize strings that already have a matching
atom, and leave anything else as the original string:

```elixir
Digger.atomize(%{"ok" => 1, "some_string_with_no_atom" => 2}, existing: true)
# => %{ok: 1, "some_string_with_no_atom" => 2}
```

## 2 - Digger.stringify/2

### The Problem

You have a nested map (or a struct that you converted to a nested map) with keys that are atoms and you want to convert those keys to strings.

You have a valid data type that needs to be "stringified" This can be an atom, number, or nested map with atom keys.

### The Solution

Digger.stringify/2 drills down into a nested map and converts (most) keys which are not strings into strings.

## 3 - Digger.camel_case/2

### The Problem

You have a valid data type that needs to be camel-cased. This can be an atom, string, or nested map (or a struct that you converted to a nested map) with string or atom keys.

### The Solution

Digger.camel_case/2 "camel cases" your valid data type according to the rules defined by its protocol.

Note: the default is UpperCamelCase (`%{user_id: 1}` becomes
`%{UserId: 1}`). For the lowerCamelCase string keys a JavaScript client
expects, see the recipe above.

## 4 - Digger.snake_case/2

### The Problem

You have a valid data type that needs to be snake-cased. This can be an atom, string, or nested map (or a struct that you converted to a nested map) with string or atom keys.

### The Solution

Digger.snake_case/2 "snake cases" your valid data type according to the rules defined by its protocol.

## 5 - Digger.dasherize/2

### The Problem

You have a valid data type that needs the underscores transformed to dashes. This can be a string, or nested map (or a struct that you converted to a nested map) with string keys.

### The Solution

Digger.dasherize/2 "dasherizes" your valid data type according to the rules defined by its protocol.

## 6 - Digger.lowercase_first/2

### The Problem

You have a valid data type that needs the first letter to be lowercase. This can be a string or atom or nested map with string or atom keys.

### The Solution

Digger.lowercase_first/2 "lowercases" your valid data type according to the rules defined by its protocol.

## 7 - Digger.upcase_first/2

### The Problem

You have a valid data type that needs the first letter to be upper case. This can be a string or atom or nested map with string or atom keys.

### The Solution

Digger.upcase_first/2 "upcases" your valid data type according to the rules defined by its protocol.

## 8 - Digger.flatten/2

### The Problem

You have a nested map and need a single-level map keyed by the full path
to each value — for query params, ENV-style config keys, log fields, or
CSV headers.

### The Solution

Digger.flatten/2 collapses the nesting into separator-joined string keys
(default separator `"."`, configurable via `separator:`):

```elixir
Digger.flatten(%{user: %{address: %{city: "SF"}}, active: true})
# => %{"user.address.city" => "SF", "active" => true}

Digger.flatten(%{config: %{db: %{host: "localhost"}}}, separator: "__")
# => %{"config__db__host" => "localhost"}
```

Path keys are converted to strings along the way. Structs (including
calendar types), lists, and empty maps are treated as leaf values and are
never descended into.

## 9 - Digger.unflatten/2

### The Problem

You have a flattened map — separator-joined keys like `"user.address.city"`
— and want the nested structure back.

### The Solution

Digger.unflatten/2 splits each string key on the separator (default `"."`)
and rebuilds the nesting. It is the exact inverse of `Digger.flatten/2` for
the maps flatten produces: `unflatten(flatten(map)) == map` whenever the
map's keys are strings that don't contain the separator (maps with atom or
number keys round-trip to their string-keyed equivalent, since flatten
converts path keys to strings):

```elixir
Digger.unflatten(%{"user.address.city" => "SF", "active" => true})
# => %{"user" => %{"address" => %{"city" => "SF"}}, "active" => true}
```

## Possible Future Work

This library is a work in progress. Lists are already supported throughout; tuple support (e.g. transforming the payload inside `{:ok, _}`/`{:error, _}` while leaving the tag alone) is planned next.

## Questions?

The tests in the test folder show you the data types that are handled. The protocol implementations in lib/impl also show you the various data types are handled.
