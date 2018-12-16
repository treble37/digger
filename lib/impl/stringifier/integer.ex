defimpl Digger.Stringifier, for: Integer do
  alias Digger.Opts.Stringifier, as: Opts

  def stringify(integer, opts) do
    to_string(integer, Opts.set_options(opts))
  end

  defp to_string(integer, type: :key, key_transform: :stringify, value_transform: _),
    do: integer |> Integer.to_string()

  defp to_string(integer, type: :value, key_transform: _, value_transform: :stringify),
    do: integer |> Integer.to_string()

  defp to_string(integer, _), do: integer
end
