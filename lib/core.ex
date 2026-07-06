defmodule Digger.Core do
  @moduledoc false

  alias Digger.Opts.Atomizer
  alias Digger.Opts.CamelCaser
  alias Digger.Opts.Dasher
  alias Digger.Opts.LowerCaser
  alias Digger.Opts.SnakeCaser
  alias Digger.Opts.Stringifier
  alias Digger.Opts.UpperCaser

  @opts_modules %{
    atomize: Atomizer,
    camel_case: CamelCaser,
    dasherize: Dasher,
    lowercase_first: LowerCaser,
    snake_case: SnakeCaser,
    stringify: Stringifier,
    upcase_first: UpperCaser
  }

  def resolve_opts(operation, opts), do: Map.fetch!(@opts_modules, operation).set_options(opts)

  # Map

  def map(map, operation, opts) do
    resolved = resolve_opts(operation, opts)
    key_transform = Keyword.get(resolved, :key_transform)
    value_transform = Keyword.get(resolved, :value_transform)

    Enum.reduce(map, %{}, fn {key, value}, acc ->
      new_key =
        apply(Digger, operation, [
          key,
          [type: :key, key_transform: key_transform, value_transform: value_transform]
        ])

      new_value =
        apply(Digger, operation, [
          value,
          [type: :value, key_transform: key_transform, value_transform: value_transform]
        ])

      Map.put(acc, new_key, new_value)
    end)
  end

  # List

  def list([], _operation, _opts), do: []

  def list([head | tail], operation, opts) do
    resolved = resolve_opts(operation, opts)
    [apply(Digger, operation, [head, resolved])] ++ apply(Digger, operation, [tail, resolved])
  end

  # Atom

  def atom(atom, :atomize, _opts), do: atom
  def atom(atom, :dasherize, _opts), do: atom

  def atom(atom, :camel_case, opts) do
    opts = CamelCaser.set_options(opts)

    atom
    |> to_string()
    |> Digger.camel_case(opts)
    |> String.to_atom()
  end

  def atom(atom, :lowercase_first, opts), do: atom_lower(atom, LowerCaser.set_options(opts))
  def atom(atom, :snake_case, opts), do: atom_snake(atom, SnakeCaser.set_options(opts))
  def atom(atom, :stringify, opts), do: atom_to_string(atom, Stringifier.set_options(opts))
  def atom(atom, :upcase_first, opts), do: atom_upper(atom, UpperCaser.set_options(opts))

  defp atom_upper(atom, type: :key, key_transform: :upper, value_transform: _) do
    atom
    |> to_string
    |> Digger.upcase_first()
    |> String.to_atom()
  end

  defp atom_upper(atom, type: :value, key_transform: _, value_transform: :upper) do
    atom
    |> to_string
    |> Digger.upcase_first()
    |> String.to_atom()
  end

  defp atom_upper(atom, _opts), do: atom

  defp atom_lower(atom, [type: :key, key_transform: :lower, value_transform: _] = opts),
    do: atom |> to_string |> Digger.lowercase_first(opts) |> String.to_atom()

  defp atom_lower(atom, [type: :value, key_transform: _, value_transform: :lower] = opts),
    do: atom |> to_string |> Digger.lowercase_first(opts) |> String.to_atom()

  defp atom_lower(atom, _), do: atom

  defp atom_snake(atom, [type: :key, key_transform: :snake, value_transform: _] = opts) do
    atom
    |> to_string
    |> Digger.snake_case(opts)
    |> String.to_atom()
  end

  defp atom_snake(atom, [type: :value, key_transform: _, value_transform: :snake] = opts) do
    atom
    |> to_string
    |> Digger.snake_case(opts)
    |> String.to_atom()
  end

  defp atom_snake(atom, _opts), do: atom

  defp atom_to_string(atom, type: :key, key_transform: :stringify, value_transform: _),
    do: atom |> Atom.to_string()

  defp atom_to_string(atom, _), do: atom

  # String

  def string(string, :atomize, opts), do: string_atomicize(string, Atomizer.set_options(opts))
  def string(string, :camel_case, opts), do: string_camelize(string, CamelCaser.set_options(opts))
  def string(string, :dasherize, opts), do: string_to_dash(string, Dasher.set_options(opts))

  def string(string, :lowercase_first, opts),
    do: string_lower_first(string, LowerCaser.set_options(opts))

  def string(string, :snake_case, opts), do: string_to_snake(string, SnakeCaser.set_options(opts))
  def string(any, :stringify, _opts), do: any

  def string(string, :upcase_first, opts),
    do: string_uppercase_first_for_upcase(string, UpperCaser.set_options(opts))

  defp string_atomicize(string, type: :key, key_transform: :atomize, value_transform: _) do
    string
    |> String.to_atom()
  end

  defp string_atomicize(string, type: :value, key_transform: _, value_transform: :atomize) do
    string
    |> String.to_atom()
  end

  defp string_atomicize(string, _opts), do: string

  defp string_camelize(string, type: :key, key_transform: :none, value_transform: _), do: string

  defp string_camelize(string, type: :value, key_transform: _, value_transform: :none),
    do: string

  defp string_camelize(string, type: :key, key_transform: key_transform, value_transform: _) do
    string
    |> String.split(~r/[-_\/]+/, include_captures: false)
    |> Enum.map_join(&string_uppercase_first_for_camelize(&1, :upper))
    |> string_uppercase_first_for_camelize(key_transform)
  end

  defp string_camelize(string, type: :value, key_transform: _, value_transform: value_transform) do
    string
    |> String.split(~r/[-_\/]+/, include_captures: false)
    |> Enum.map_join(&string_uppercase_first_for_camelize(&1, :upper))
    |> string_uppercase_first_for_camelize(value_transform)
  end

  defp string_uppercase_first_for_camelize(string, :upper) do
    remainder = String.slice(string, 1..-1//-1)

    string
    |> String.first()
    |> String.capitalize()
    |> Kernel.<>(remainder)
  end

  defp string_uppercase_first_for_camelize(string, _first_letter) do
    remainder = String.slice(string, 1..-1//-1)

    string
    |> String.first()
    |> String.downcase()
    |> Kernel.<>(remainder)
  end

  defp string_to_dash(string, type: :key, key_transform: :dasherize, value_transform: _),
    do: string |> String.replace(~r/_/, "-")

  defp string_to_dash(string, type: :value, key_transform: _, value_transform: :dasherize),
    do: string |> String.replace(~r/_/, "-")

  defp string_to_dash(string, _), do: string

  defp string_lower_first(string, type: :key, key_transform: :lower, value_transform: _) do
    string
    |> string_to_lower()
  end

  defp string_lower_first(string, type: :value, key_transform: _, value_transform: :lower) do
    string
    |> string_to_lower()
  end

  defp string_lower_first(string, _), do: string

  defp string_to_lower(string) do
    remainder = String.slice(string, 1..-1//-1)

    string
    |> String.first()
    |> String.downcase()
    |> Kernel.<>(remainder)
  end

  defp string_to_snake(string, type: :key, key_transform: :snake, value_transform: _) do
    string
    |> String.replace(~r/([A-Z\d]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.replace(~r/-/, "_")
    |> String.downcase()
  end

  defp string_to_snake(string, type: :value, key_transform: _, value_transform: :snake) do
    string
    |> String.replace(~r/([A-Z\d]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.replace(~r/-/, "_")
    |> String.downcase()
  end

  defp string_to_snake(string, _), do: string

  defp string_uppercase_first_for_upcase(
         string,
         type: :value,
         key_transform: _,
         value_transform: :upper
       ) do
    remainder = String.slice(string, 1..-1//-1)

    string
    |> String.first()
    |> String.capitalize()
    |> Kernel.<>(remainder)
  end

  defp string_uppercase_first_for_upcase(
         string,
         type: :key,
         key_transform: :upper,
         value_transform: _
       ) do
    remainder = String.slice(string, 1..-1//-1)

    string
    |> String.first()
    |> String.capitalize()
    |> Kernel.<>(remainder)
  end

  defp string_uppercase_first_for_upcase(string, _), do: string

  # Integer & Float share identical numeric logic for atomize/stringify; the
  # other 5 ops are unconditional passthroughs for both types.

  @numeric_passthrough_ops [:camel_case, :dasherize, :lowercase_first, :snake_case, :upcase_first]

  def integer(integer, :atomize, opts), do: numeric_atomize(integer, Atomizer.set_options(opts))
  def integer(any, op, _opts) when op in @numeric_passthrough_ops, do: any

  def integer(integer, :stringify, opts),
    do: numeric_stringify(integer, Stringifier.set_options(opts), &Integer.to_string/1)

  def float(float, :atomize, opts), do: numeric_atomize(float, Atomizer.set_options(opts))
  def float(any, op, _opts) when op in @numeric_passthrough_ops, do: any

  def float(float, :stringify, opts),
    do: numeric_stringify(float, Stringifier.set_options(opts), &Float.to_string/1)

  defp numeric_atomize(number, type: :key, key_transform: :atomize, value_transform: _) do
    number
    |> to_string()
    |> String.to_atom()
  end

  defp numeric_atomize(number, type: :value, key_transform: _, value_transform: :atomize) do
    number
    |> to_string()
    |> String.to_atom()
  end

  defp numeric_atomize(number, _opts), do: number

  defp numeric_stringify(
         number,
         [type: :key, key_transform: :stringify, value_transform: _],
         to_string_fn
       ),
       do: to_string_fn.(number)

  defp numeric_stringify(
         number,
         [type: :value, key_transform: _, value_transform: :stringify],
         to_string_fn
       ),
       do: to_string_fn.(number)

  defp numeric_stringify(number, _opts, _to_string_fn), do: number
end
