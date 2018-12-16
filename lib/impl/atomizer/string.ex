defimpl Digger.Atomizer, for: BitString do
  alias Digger.Opts.Atomizer, as: Opts

  def atomize(string, opts) do
    atomicize(string, Opts.set_options(opts))
  end

  defp atomicize(string, type: :key, key_transform: :atomize, value_transform: _) do
    string
    |> String.to_atom()
  end

  defp atomicize(string, type: :value, key_transform: _, value_transform: :atomize) do
    string
    |> String.to_atom()
  end

  defp atomicize(string, _opts), do: string
end
