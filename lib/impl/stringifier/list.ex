defimpl Digger.Stringifier, for: List do
  alias Digger.Stringifier

  def stringify([], _), do: []

  def stringify(
        [h | t],
        opts
      ) do
    [Stringifier.stringify(h, opts)] ++ Stringifier.stringify(t, opts)
  end
end
