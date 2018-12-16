defimpl Digger.UpperCaser, for: BitString do
  alias Digger.Opts.UpperCaser, as: Opts

  def upcase_first(string, opts) do
    opts = Opts.set_options(opts)

    string
    |> uppercase_first(opts)
  end

  defp uppercase_first(string, type: :key, key_transform: :upper, value_transform: _) do
    remainder = String.slice(string, 1..-1)

    string
    |> String.first()
    |> String.capitalize()
    |> Kernel.<>(remainder)
  end

  defp uppercase_first(string, type: :value, key_transform: _, value_transform: :upper) do
    remainder = String.slice(string, 1..-1)

    string
    |> String.first()
    |> String.capitalize()
    |> Kernel.<>(remainder)
  end

  defp uppercase_first(string, _), do: string
end
