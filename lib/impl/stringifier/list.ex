defimpl Digger.Stringifier, for: List do
  alias Digger.Stringifier
  alias Digger.Opts.Stringifier, as: Opts

  def stringify([], _), do: []

  def stringify(
        [h | t],
        opts
      ) do
    opts = Opts.set_options(opts)
    [Stringifier.stringify(h, opts)] ++ Stringifier.stringify(t, opts)
  end
end
