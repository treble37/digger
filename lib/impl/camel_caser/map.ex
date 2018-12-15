defimpl Digger.CamelCaser, for: Map do
  alias Digger.CamelCaser

  def camel_case(
        map,
        type: _type,
        first_letter_key: first_letter_key,
        first_letter_value: first_letter_value
      ) do
    map
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.merge(acc, %{
        CamelCaser.camel_case(key,
          type: :key,
          first_letter_key: first_letter_key,
          first_letter_value: first_letter_value
        ) =>
          CamelCaser.camel_case(value,
            type: :value,
            first_letter_key: first_letter_key,
            first_letter_value: first_letter_value
          )
      })
    end)
  end
end
