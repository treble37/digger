defimpl Digger.Atomizer, for: List do
  alias Digger.Atomizer

  def atomize([], _atomize), do: []

  def atomize([h | t], :atomize) do
    [Atomizer.atomize(h, :atomize)] ++ Atomizer.atomize(t, :atomize)
  end

  def atomize(list, _atomize), do: list
end
