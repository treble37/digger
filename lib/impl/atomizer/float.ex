defimpl Digger.Atomizer, for: Float do
  def atomize(float, :atomize) do
    float
    |> to_string
    |> String.to_atom
  end
  def atomize(float, _atomize), do: float
end
