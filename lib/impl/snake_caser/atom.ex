defimpl Digger.SnakeCaser.Protocol, for: Atom do
  alias Digger.SnakeCaser.Delegator

  def underscore(atom) do
    to_string(atom)
    |> Delegator.underscore
    |> String.to_atom
  end
end
