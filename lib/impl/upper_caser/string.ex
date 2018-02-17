defimpl Digger.UpperCaser, for: BitString do
  def upcase_first(string) do
    string
    |> uppercase_first(:upper)
  end

  defp uppercase_first(string, :upper) do
    remainder = String.slice(string, 1..-1)
    string
    |> String.first
    |> String.capitalize
    |> Kernel.<>(remainder)
  end
end
