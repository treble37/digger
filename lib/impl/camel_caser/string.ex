defimpl Digger.CamelCaser, for: BitString do
  def camel_case(string, first_letter) do
    string
    |> String.split(~r/[-_\/]+/, include_captures: false)
    |> Enum.map_join(&(uppercase_first(&1, :upper)))
    |> uppercase_first(first_letter)
  end

  defp uppercase_first(string, :upper) do
    remainder = String.slice(string, 1..-1)
    string
    |> String.first
    |> String.capitalize
    |> Kernel.<>(remainder)
  end
  defp uppercase_first(string, _first_letter) do
    remainder = String.slice(string, 1..-1)
    string
    |> String.first
    |> String.downcase
    |> Kernel.<>(remainder)
  end
end
