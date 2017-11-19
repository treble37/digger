defimpl Digger.Atomizer.Protocol, for: Atom do
  def atomize(atom, _atomize), do: atom
end
