defimpl Digger.SnakeCaser.Protocol, for: Atom do
  alias Digger.SnakeCaser.Delegator

  def underscore(atom) do
    atom
    |> to_string
    |> Delegator.underscore
    |> String.to_atom
  end
end
