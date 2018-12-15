defimpl Digger.Atomizer, for: BitString do
  def atomize(string, type: :key, atomize_key: true, atomize_value: _) do
    string
    |> String.to_atom()
  end

  def atomize(string, type: :value, atomize_key: _, atomize_value: true) do
    string
    |> String.to_atom()
  end

  def atomize(string, _opts), do: string
end
