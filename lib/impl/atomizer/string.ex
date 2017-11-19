defimpl Digger.Atomizer.Protocol, for: BitString do
  def atomize(string, "atomize") do
    string
    |> String.to_atom
  end
  def atomize(string, _atomize), do: string
end
