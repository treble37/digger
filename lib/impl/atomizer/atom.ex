defimpl Digger.Atomizer.Protocol, for: Atom do
  alias Digger.Atomizer.Delegator

  def atomize(atom), do: atom
end
