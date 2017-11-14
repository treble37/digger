defimpl Digger.CamelCaser.Protocol, for: Atom do
  alias Digger.CamelCaser.Delegator

  def camelize(atom, first_letter) do
    atom
    |> to_string
    |> Delegator.camelize(first_letter)
    |> String.to_atom
  end
end
