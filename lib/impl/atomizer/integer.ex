defimpl Digger.Atomizer, for: Integer do
  def atomize(integer, type: :key, atomize_key: true, atomize_value: _) do
    integer
    |> to_atom()
  end

  def atomize(integer, type: :value, atomize_key: _, atomize_value: true) do
    integer
    |> to_atom
  end

  def atomize(integer, _opts), do: integer

  defp to_atom(integer) do
    integer
    |> to_string
    |> String.to_atom()
  end
end
