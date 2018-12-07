defimpl Digger.CamelCaser, for: List do
  alias Digger.CamelCaser

  def camel_case([], _first_letter), do: []

  def camel_case([h | t], first_letter) do
    [CamelCaser.camel_case(h, first_letter)] ++ CamelCaser.camel_case(t, first_letter)
  end
end
