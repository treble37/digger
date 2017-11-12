defimpl Digger.CamelCaser.Protocol, for: BitString do
  def camelize(string, first_letter) do
    string
    |> String.split(~r/[-_\/]+/, include_captures: false)
    |> Enum.map_join(&(uppercase_first(&1, :upper)))
    |> uppercase_first(first_letter)
  end

  defp uppercase_first(string, :upper) do
    remainder = String.slice(string, 1..-1)
    String.first(string)
    |> String.capitalize
    |> Kernel.<>(remainder)
  end
  defp uppercase_first(string, _first_letter) do
    remainder = String.slice(string, 1..-1)
    String.first(string)
    |> String.downcase
    |> Kernel.<>(remainder)
  end
end
