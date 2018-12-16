defimpl Digger.Atomizer, for: List do
  alias Digger.Atomizer
  alias Digger.Opts.Atomizer, as: Opts

  def atomize([], _opts), do: []

  def atomize([h | t], opts) do
    opts = Opts.set_options(opts)
    [Atomizer.atomize(h, opts)] ++ Atomizer.atomize(t, opts)
  end
end
