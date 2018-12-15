defimpl Digger.Stringifier, for: Atom do
  def stringify(atom, type: "key", stringify_key: true, stringify_value: _),
    do: atom |> Atom.to_string()

  def stringify(atom, type: "value", stringify_value: true, stringify_value: _),
    do: atom |> Atom.to_string()

  def stringify(atom, _), do: atom
end
