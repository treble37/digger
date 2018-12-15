defimpl Digger.CamelCaser, for: BitString do
  def camel_case(string, type: :key, first_letter_key: :none, first_letter_value: _), do: string
  def camel_case(string, type: :value, first_letter_key: _, first_letter_value: :none), do: string

  def camel_case(string, type: :key, first_letter_key: first_letter_key, first_letter_value: _) do
    string
    |> String.split(~r/[-_\/]+/, include_captures: false)
    |> Enum.map_join(&uppercase_first(&1, :upper))
    |> uppercase_first(first_letter_key)
  end

  def camel_case(string, type: :value, first_letter_key: _, first_letter_value: first_letter_value) do
    string
    |> String.split(~r/[-_\/]+/, include_captures: false)
    |> Enum.map_join(&uppercase_first(&1, :upper))
    |> uppercase_first(first_letter_value)
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
