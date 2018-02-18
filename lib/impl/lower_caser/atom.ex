defimpl Digger.LowerCaser, for: Atom do
  alias Digger.LowerCaser

  def lowercase_first(atom) do
    atom
    |> to_string
    |> LowerCaser.lowercase_first
    |> String.to_atom
  end
end
