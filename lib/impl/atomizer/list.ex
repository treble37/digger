defimpl Digger.Atomizer, for: List do
  alias Digger.Atomizer

  def atomize([], _opts), do: []

  def atomize([h | t], opts) do
    [Atomizer.atomize(h, opts)] ++ Atomizer.atomize(t, opts)
  end
end
