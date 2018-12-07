defimpl Digger.LowerCaser, for: List do
  alias Digger.LowerCaser

  def lowercase_first([]), do: []

  def lowercase_first([h | t]) do
    [LowerCaser.lowercase_first(h)] ++ LowerCaser.lowercase_first(t)
  end
end
