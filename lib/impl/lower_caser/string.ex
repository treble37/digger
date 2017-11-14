defimpl Digger.LowerCaser.Protocol, for: BitString do
  def lowercase_first(string) do
    string
    |> lower_first(:lower)
  end

  defp lower_first(string, :lower) do
    remainder = String.slice(string, 1..-1)
    string
    |> String.first
    |> String.downcase
    |> Kernel.<>(remainder)
  end
end
