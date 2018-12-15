defimpl Digger.Atomizer, for: Map do
  alias Digger.Atomizer

  def atomize(map, type: _type, atomize_key: atomize_key, atomize_value: atomize_value) do
    map
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.merge(acc, %{
        Atomizer.atomize(key, type: :key, atomize_key: atomize_key, atomize_value: atomize_value) =>
          Atomizer.atomize(value,
            type: :value,
            atomize_key: atomize_key,
            atomize_value: atomize_value
          )
      })
    end)
  end
end
