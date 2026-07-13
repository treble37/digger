# Bridging camelCase JSON and snake_case Elixir

A common need in Phoenix APIs: JavaScript clients send and expect
camelCase JSON keys, while Elixir code uses snake_case. Digger's
existing functions compose into both directions of that bridge — no
extra dependency, no adapter module.

All examples below are verified against the current version of the
library.

## Incoming: camelCase params → snake_case keys

```elixir
%{"userId" => 1, "displayName" => "johnDoe"}
|> Digger.snake_case()
#=> %{"user_id" => 1, "display_name" => "johnDoe"}
```

Only *keys* are transformed — string *values* like `"johnDoe"` pass
through untouched, so payload data is never corrupted.

If you also want atom keys, add `Digger.atomize/2` with the
`existing: true` option so unknown keys can never exhaust the atom
table:

```elixir
%{"userId" => 1, "displayName" => "johnDoe", "evilKey" => "x"}
|> Digger.snake_case()
|> Digger.atomize(existing: true)
#=> %{:user_id => 1, :display_name => "johnDoe", "evil_key" => "x"}
```

Keys whose atoms already exist in your application (for example,
because an Ecto schema defines the field) become atoms; unknown keys
stay strings instead of allocating new atoms. This makes the pipeline
safe to run on untrusted input.

> #### Phoenix convention {: .info}
>
> Phoenix keeps `conn.params` string-keyed, and Ecto changesets cast
> string-keyed params directly — so for most controllers,
> `Digger.snake_case/1` alone is all you need. Reach for
> `atomize(existing: true)` only where your code genuinely wants atom
> keys.

### As a plug

```elixir
defmodule MyAppWeb.Plugs.SnakeCaseParams do
  @moduledoc "Converts camelCase param keys to snake_case."
  @behaviour Plug

  def init(opts), do: opts

  def call(conn, _opts) do
    %{conn | params: Digger.snake_case(conn.params)}
  end
end
```

Then in your router pipeline:

```elixir
pipeline :api do
  plug :accepts, ["json"]
  plug MyAppWeb.Plugs.SnakeCaseParams
end
```

## Outgoing: snake_case data → camelCase JSON

```elixir
%{user_id: 1, display_name: "johnDoe", order_items: [%{item_id: 2}]}
|> Digger.stringify()
|> Digger.camel_case(type: :key, key_transform: :lower, value_transform: :none)
#=> %{"userId" => 1, "displayName" => "johnDoe", "orderItems" => [%{"itemId" => 2}]}
```

The options matter:

- `key_transform: :lower` produces lowerCamelCase (`userId`), the
  JavaScript convention — the default is UpperCamelCase (`UserId`).
- `type: :key` with `value_transform: :none` restricts the transform
  to keys, leaving all values (including lists of strings) untouched.
- `Digger.stringify/1` first converts atom keys to strings, so no new
  atoms are ever created for outgoing data.

Calendar structs (`Date`, `DateTime`, `NaiveDateTime`, `Time`) pass
through every Digger transform untouched — a guarantee covered by the
test suite — so timestamp values in your response maps are safe.

### In a Phoenix JSON view

```elixir
defmodule MyAppWeb.UserJSON do
  def show(%{user: user}) do
    %{
      user_id: user.id,
      display_name: user.display_name,
      inserted_at: user.inserted_at
    }
    |> Digger.stringify()
    |> Digger.camel_case(type: :key, key_transform: :lower, value_transform: :none)
  end
end
```

## Why a recipe instead of a shipped plug?

Digger deliberately ships zero runtime dependencies and no framework
adapters. The bridge above is ~10 lines of your own code composed from
functions you already have — easy to read, easy to adjust (for
example, skipping conversion for a webhook route that must preserve
key case), and with no extra package to keep in sync with Plug
releases.
