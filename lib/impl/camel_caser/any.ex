defimpl Digger.CamelCaser.Protocol, for: Any do
  def camelize(any, _first_letter) do
    any
  end
end
