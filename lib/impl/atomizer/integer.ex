defimpl Digger.Atomizer.Protocol, for: Integer do
  def atomize(integer, "atomize") do
    integer
    |> to_string
    |> String.to_atom
  end

  def atomize(integer, _atomize), do: integer
end
