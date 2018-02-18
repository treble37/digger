defimpl Digger.UpperCaser, for: Atom do
  alias Digger.UpperCaser

  def upcase_first(atom) do
    atom
    |> to_string
    |> UpperCaser.upcase_first
    |> String.to_atom
  end
end
