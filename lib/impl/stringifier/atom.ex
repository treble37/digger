defimpl Digger.Stringifier, for: Atom do
  alias Digger.Opts.Stringifier, as: Opts

  def stringify(atom, opts) do
    to_string(atom, Opts.set_options(opts))
  end

  defp to_string(atom, type: :key, key_transform: :stringify, value_transform: _),
    do: atom |> Atom.to_string()

  defp to_string(atom, type: :value, value_transform: :stringify, value_transform: _),
    do: atom |> Atom.to_string()

  defp to_string(atom, _), do: atom
end
