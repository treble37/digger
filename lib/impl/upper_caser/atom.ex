defimpl Digger.UpperCaser.Protocol, for: Atom do
  alias Digger.UpperCaser.Delegator

  def upcase_first(atom) do
    atom
    |> to_string
    |> Delegator.upcase_first
    |> String.to_atom
  end
end
