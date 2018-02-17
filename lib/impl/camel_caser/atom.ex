defimpl Digger.CamelCaser, for: Atom do
  alias Digger.CamelCaser

  def camel_case(atom, first_letter) do
    atom
    |> to_string
    |> CamelCaser.camel_case(first_letter)
    |> String.to_atom
  end
end
