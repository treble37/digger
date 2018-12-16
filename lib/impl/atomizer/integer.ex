defimpl Digger.Atomizer, for: Integer do
  alias Digger.Opts.Atomizer, as: Opts

  def atomize(integer, opts) do
    atomicize(integer, Opts.set_options(opts))
  end

  defp atomicize(integer, type: :key, key_transform: :atomize, value_transform: _) do
    integer
    |> to_atom()
  end

  defp atomicize(integer, type: :value, key_transform: _, value_transform: :atomize) do
    integer
    |> to_atom()
  end

  defp atomicize(integer, _opts), do: integer

  defp to_atom(integer) do
    integer
    |> to_string
    |> String.to_atom()
  end
end
