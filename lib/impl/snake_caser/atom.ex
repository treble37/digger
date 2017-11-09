defimpl Digger.SnakeCaser.Protocol, for: Atom do
  def underscore(atom) do
    String.to_atom(atom)
  end
end
