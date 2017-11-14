defimpl Digger.LowerCaser.Protocol, for: Atom do
  alias Digger.LowerCaser.Delegator

  def lowercase_first(atom) do
    atom
    |> to_string
    |> Delegator.lowercase_first
    |> String.to_atom
  end
end
