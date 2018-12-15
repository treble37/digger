defimpl Digger.CamelCaser, for: Atom do
  alias Digger.CamelCaser

  def camel_case(atom, opts) do
    atom
    |> to_string
    |> CamelCaser.camel_case(opts)
    |> String.to_atom()
  end
end
