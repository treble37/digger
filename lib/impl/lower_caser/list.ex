defimpl Digger.LowerCaser, for: List do
  alias Digger.LowerCaser
  alias Digger.Opts.LowerCaser, as: Opts

  def lowercase_first([], _opts), do: []

  def lowercase_first([h | t], opts) do
    opts = Opts.set_options(opts)
    [LowerCaser.lowercase_first(h, opts)] ++ LowerCaser.lowercase_first(t, opts)
  end
end
