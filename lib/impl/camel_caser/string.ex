defimpl Digger.CamelCaser, for: BitString do
  alias Digger.Opts.CamelCaser, as: Opts

  def camel_case(string, opts) do
    camelize(string, Opts.set_options(opts))
  end

  defp camelize(string, type: :key, key_transform: :none, value_transform: _), do: string
  defp camelize(string, type: :value, key_transform: _, value_transform: :none), do: string

  defp camelize(string, type: :key, key_transform: key_transform, value_transform: _) do
    string
    |> String.split(~r/[-_\/]+/, include_captures: false)
    |> Enum.map_join(&uppercase_first(&1, :upper))
    |> uppercase_first(key_transform)
  end

  defp camelize(string, type: :value, key_transform: _, value_transform: value_transform) do
    string
    |> String.split(~r/[-_\/]+/, include_captures: false)
    |> Enum.map_join(&uppercase_first(&1, :upper))
    |> uppercase_first(value_transform)
  end

  defp uppercase_first(string, :upper) do
    remainder = String.slice(string, 1..-1)

    string
    |> String.first()
    |> String.capitalize()
    |> Kernel.<>(remainder)
  end

  defp uppercase_first(string, _first_letter) do
    remainder = String.slice(string, 1..-1)

    string
    |> String.first()
    |> String.downcase()
    |> Kernel.<>(remainder)
  end
end
