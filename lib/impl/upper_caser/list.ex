defimpl Digger.UpperCaser, for: List do
  alias Digger.UpperCaser

  def upcase_first([]), do: []

  def upcase_first([h | t]) do
    [UpperCaser.upcase_first(h)] ++ UpperCaser.upcase_first(t)
  end
end
