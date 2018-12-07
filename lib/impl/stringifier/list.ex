defimpl Digger.Stringifier, for: List do
  alias Digger.Stringifier

  def stringify([], _stringify), do: []

  def stringify([h | t], :stringify) do
    [Stringifier.stringify(h, :stringify)] ++ Stringifier.stringify(t, :stringify)
  end

  def stringify(list, _stringify), do: list
end
