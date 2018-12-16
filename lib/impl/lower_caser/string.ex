defimpl Digger.LowerCaser, for: BitString do
  alias Digger.Opts.LowerCaser, as: Opts

  def lowercase_first(string, opts) do
    opts = Opts.set_options(opts)

    string
    |> lower_first(opts)
  end

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
end
