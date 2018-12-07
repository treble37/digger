defimpl Digger.Dasher, for: List do
  alias Digger.Dasher

  def dasherize([]), do: []

  def dasherize([h | t]) do
    [Dasher.dasherize(h)] ++ Dasher.dasherize(t)
  end
end
