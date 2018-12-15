defimpl Digger.Atomizer, for: Float do
  def atomize(float, type: :key, atomize_key: true, atomize_value: _) do
    float
    |> to_atom()
  end

  def atomize(float, type: :value, atomize_key: _, atomize_value: true) do
    float
    |> to_atom()
  end

  def atomize(float, _opts), do: float

  defp to_atom(float) do
    float
    |> to_string
    |> String.to_atom()
  end
end
