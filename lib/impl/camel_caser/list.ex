defimpl Digger.CamelCaser, for: List do
  alias Digger.CamelCaser

  def camel_case([], _opts), do: []

  def camel_case([h | t], opts) do
    [CamelCaser.camel_case(h, opts)] ++ CamelCaser.camel_case(t, opts)
  end
end
