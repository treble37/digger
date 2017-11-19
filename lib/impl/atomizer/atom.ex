defimpl Digger.Atomizer.Protocol, for: Atom do
  alias Digger.Atomizer.Delegator

  def atomize(atom, _atomize), do: atom
end
