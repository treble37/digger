defimpl Digger.Stringifier, for: Atom do
  def stringify(atom, :stringify), do: atom |> Atom.to_string
end
