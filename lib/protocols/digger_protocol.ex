defprotocol Digger do
  @moduledoc """
  Documentation for Digger Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  'Atomize' a valid Types.data_type according to the protocol implementation

  By default, atomizing a string that has no corresponding existing atom
  creates a new one via `String.to_atom/1`, which is safe for trusted input
  but can exhaust the atom table if used on untrusted/external data (atoms
  are never garbage collected).

  Pass `existing: true` to atomize via `String.to_existing_atom/1` instead:
  strings that already have a matching atom are converted as usual, and
  strings that don't are left as the original string rather than raising or
  creating a new atom.

  ## Examples

      iex> Digger.atomize(%{"user" => %{"name" => "Ada"}})
      %{user: %{name: "Ada"}}

      iex> Digger.atomize(%{"ok" => 1, "no_such_atom_xyz" => 2}, existing: true)
      %{:ok => 1, "no_such_atom_xyz" => 2}
  """

  @spec atomize(Types.data_type(), keyword()) :: Types.valid_return_type()
  def atomize(
        data_type,
        opts \\ [type: :key, key_transform: :atomize, value_transform: :none]
      )

  @doc """
  Camel case a valid Types.data_type according to the protocol implementation

  The default is UpperCamelCase; pass `key_transform: :lower` for the
  lowerCamelCase convention used in JavaScript APIs.

  ## Examples

      iex> Digger.camel_case(%{user_id: 1})
      %{UserId: 1}

      iex> Digger.camel_case(
      ...>   %{user_id: 1},
      ...>   type: :key, key_transform: :lower, value_transform: :none
      ...> )
      %{userId: 1}
  """

  @spec camel_case(Types.data_type(), keyword()) :: Types.valid_return_type()
  def camel_case(
        data_type,
        opts \\ [type: :key, key_transform: :upper, value_transform: :none]
      )

  @doc """
  'Dasherize' a valid Types.data_type according to the protocol implementation

  ## Examples

      iex> Digger.dasherize(%{"foo_bar" => 1})
      %{"foo-bar" => 1}
  """

  @spec dasherize(Types.data_type(), keyword()) :: Types.valid_return_type()
  def dasherize(
        data_type,
        opts \\ [type: :key, key_transform: :dasherize, value_transform: :none]
      )

  @doc """
  Flatten a nested map into a single-level map whose keys are the
  separator-joined paths (default separator `"."`) to each leaf value

  Path keys are converted to strings with `to_string/1`, so keys must
  implement `String.Chars` (atoms, strings, and numbers all do).
  Structs (including calendar types like `Date`), lists, and empty maps
  are leaf values — they are never descended into. Non-map input passes
  through unchanged.

  ## Examples

      iex> Digger.flatten(%{a: %{b: 1}})
      %{"a.b" => 1}

      iex> Digger.flatten(%{"user" => %{"id" => 7}}, separator: "/")
      %{"user/id" => 7}
  """

  @spec flatten(Types.data_type(), keyword()) :: Types.valid_return_type()
  def flatten(data_type, opts \\ [separator: "."])

  @doc """
  Lower case first letter of a valid Types.data_type according to the protocol implementation

  ## Examples

      iex> Digger.lowercase_first(%{"FooBar" => 1})
      %{"fooBar" => 1}
  """

  @spec lowercase_first(Types.data_type(), keyword()) :: Types.valid_return_type()
  def lowercase_first(
        data_type,
        opts \\ [type: :key, key_transform: :lower, value_transform: :none]
      )

  @doc """
  snake_case a valid Types.data_type according to the protocol implementation

  Only keys are transformed by default — string values pass through
  unchanged.

  ## Examples

      iex> Digger.snake_case(%{"userId" => 1, "displayName" => "johnDoe"})
      %{"user_id" => 1, "display_name" => "johnDoe"}
  """

  @spec snake_case(Types.data_type(), keyword()) :: Types.valid_return_type()
  def snake_case(data_type, opts \\ [type: :key, key_transform: :snake, value_transform: :none])

  @doc """
  'Stringify' a valid Types.data_type according to the protocol implementation

  ## Examples

      iex> Digger.stringify(%{user: %{name: "Ada"}})
      %{"user" => %{"name" => "Ada"}}
  """

  @spec stringify(Types.data_type(), keyword()) :: Types.valid_return_type()
  def stringify(
        data_type,
        opts \\ [type: :key, key_transform: :stringify, value_transform: :none]
      )

  @doc """
  Rebuild a nested map from a flattened one by splitting each string key
  on the separator (default `"."`)

  The exact inverse of `Digger.flatten/2` for the maps it produces:
  `unflatten(flatten(map)) == map` whenever `map`'s keys are strings
  that don't contain the separator. Maps with atom or number keys
  round-trip to their string-keyed equivalent, since `flatten/2`
  converts path keys to strings. Non-string keys are kept in place,
  never split. Non-map input passes through unchanged.

  ## Examples

      iex> Digger.unflatten(%{"a.b" => 1, "a.c" => 2})
      %{"a" => %{"b" => 1, "c" => 2}}

      iex> Digger.unflatten(%{"user/id" => 7}, separator: "/")
      %{"user" => %{"id" => 7}}
  """

  @spec unflatten(Types.data_type(), keyword()) :: Types.valid_return_type()
  def unflatten(data_type, opts \\ [separator: "."])

  @doc """
  Upper case the first letter of a valid Types.data_type according to
  the protocol implementation

  ## Examples

      iex> Digger.upcase_first(%{"fooBar" => 1})
      %{"FooBar" => 1}
  """

  @spec upcase_first(Types.data_type(), keyword()) :: Types.valid_return_type()
  def upcase_first(
        data_type,
        opts \\ [type: :key, key_transform: :upper, value_transform: :none]
      )
end
