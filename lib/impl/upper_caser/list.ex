defimpl Digger.UpperCaser, for: List do
  alias Digger.UpperCaser
  alias Digger.Opts.UpperCaser, as: Opts

  def upcase_first([], _opts), do: []

  def upcase_first([h | t], opts) do
    opts = Opts.set_options(opts)
    [UpperCaser.upcase_first(h, opts)] ++ UpperCaser.upcase_first(t, opts)
  end
end
