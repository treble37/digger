defimpl Digger.Atomizer.Protocol, for: BitString do
  def atomize(string) do
    string
    |> String.to_atom
  end
end
