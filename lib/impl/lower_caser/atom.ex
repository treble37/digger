defimpl Digger.LowerCaser, for: Atom do
  alias Digger.LowerCaser
  alias Digger.Opts.LowerCaser, as: Opts

  def lowercase_first(atom, opts) do
    opts = Opts.set_options(opts)

    atom
    |> to_lower(opts)
  end

  defp to_lower(
         atom,
         [type: :key, key_transform: :lower, value_transform: _] = opts
       ),
       do: atom |> to_string |> LowerCaser.lowercase_first(opts) |> String.to_atom()

  defp to_lower(
         atom,
         [type: :value, key_transform: _, value_transform: :lower] = opts
       ),
       do: atom |> to_string |> LowerCaser.lowercase_first(opts) |> String.to_atom()

  defp to_lower(atom, _), do: atom
end
