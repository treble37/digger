defimpl Digger.Atomizer, for: Float do
  alias Digger.Opts.Atomizer, as: Opts

  def atomize(float, opts) do
    atomicize(float, Opts.set_options(opts))
  end

  defp atomicize(float, type: :key, key_transform: :atomize, value_transform: _) do
    float
    |> to_atom()
  end

  defp atomicize(float, type: :value, key_transform: _, value_transform: :atomize) do
    float
    |> to_atom()
  end

  defp atomicize(float, _opts), do: float

  defp to_atom(float) do
    float
    |> to_string
    |> String.to_atom()
  end
end
