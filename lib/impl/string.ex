defimpl Digger, for: BitString do
  alias Digger.Opts.Atomizer, as: AOpts
  alias Digger.Opts.CamelCaser, as: CCOpts
  alias Digger.Opts.Dasher, as: DOpts
  alias Digger.Opts.LowerCaser, as: LCOpts
  alias Digger.Opts.SnakeCaser, as: SCOpts
  alias Digger.Opts.UpperCaser, as: UCOpts

  def atomize(string, opts) do
    atomicize(string, AOpts.set_options(opts))
  end

  def camel_case(string, opts) do
    camelize(string, CCOpts.set_options(opts))
  end

  def dasherize(string, opts) do
    to_dash(string, DOpts.set_options(opts))
  end

  def lowercase_first(string, opts) do
    opts = LCOpts.set_options(opts)

    string
    |> lower_first(opts)
  end

  def snake_case(string, opts) do
    opts = SCOpts.set_options(opts)

    string
    |> to_snake(opts)
  end

  def stringify(any, _), do: any

  def upcase_first(string, opts) do
    opts = UCOpts.set_options(opts)

    string
    |> uppercase_first_for_upcase(opts)
  end

  # for atomize/2
  defp atomicize(string, type: :key, key_transform: :atomize, value_transform: _) do
    string
    |> String.to_atom()
  end

  defp atomicize(string, type: :value, key_transform: _, value_transform: :atomize) do
    string
    |> String.to_atom()
  end

  defp atomicize(string, _opts), do: string

  # for camel_case/2
  defp camelize(string, type: :key, key_transform: :none, value_transform: _), do: string
  defp camelize(string, type: :value, key_transform: _, value_transform: :none), do: string

  defp camelize(string, type: :key, key_transform: key_transform, value_transform: _) do
    string
    |> String.split(~r/[-_\/]+/, include_captures: false)
    |> Enum.map_join(&uppercase_first_for_camelize(&1, :upper))
    |> uppercase_first_for_camelize(key_transform)
  end

  defp camelize(string, type: :value, key_transform: _, value_transform: value_transform) do
    string
    |> String.split(~r/[-_\/]+/, include_captures: false)
    |> Enum.map_join(&uppercase_first_for_camelize(&1, :upper))
    |> uppercase_first_for_camelize(value_transform)
  end

  defp uppercase_first_for_camelize(string, :upper) do
    remainder = String.slice(string, 1..-1)

    string
    |> String.first()
    |> String.capitalize()
    |> Kernel.<>(remainder)
  end

  defp uppercase_first_for_camelize(string, _first_letter) do
    remainder = String.slice(string, 1..-1)

    string
    |> String.first()
    |> String.downcase()
    |> Kernel.<>(remainder)
  end

  # for dasherize/2
  defp to_dash(string, type: :key, key_transform: :dasherize, value_transform: _),
    do: string |> String.replace(~r/_/, "-")

  defp to_dash(string, type: :value, key_transform: _, value_transform: :dasherize),
    do: string |> String.replace(~r/_/, "-")

  defp to_dash(string, _), do: string

  # for lowercase_first/2
  defp lower_first(string, type: :key, key_transform: :lower, value_transform: _) do
    string
    |> to_lower()
  end

  defp lower_first(string, type: :value, key_transform: _, value_transform: :lower) do
    string
    |> to_lower()
  end

  defp lower_first(string, _), do: string

  defp to_lower(string) do
    remainder = String.slice(string, 1..-1)

    string
    |> String.first()
    |> String.downcase()
    |> Kernel.<>(remainder)
  end

  # for to_snake/2
  defp to_snake(string, type: :key, key_transform: :snake, value_transform: _) do
    string
    |> String.replace(~r/([A-Z\d]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.replace(~r/-/, "_")
    |> String.downcase()
  end

  defp to_snake(string, type: :value, key_transform: _, value_transform: :snake) do
    string
    |> String.replace(~r/([A-Z\d]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.replace(~r/-/, "_")
    |> String.downcase()
  end

  defp to_snake(string, _), do: string

  # for upcase_first/2

  defp uppercase_first_for_upcase(string, type: :value, key_transform: _, value_transform: :upper) do
    remainder = String.slice(string, 1..-1)

    string
    |> String.first()
    |> String.capitalize()
    |> Kernel.<>(remainder)
  end

  defp uppercase_first_for_upcase(string, type: :key, key_transform: :upper, value_transform: _) do
    remainder = String.slice(string, 1..-1)

    string
    |> String.first()
    |> String.capitalize()
    |> Kernel.<>(remainder)
  end

  defp uppercase_first_for_upcase(string, _), do: string
end
