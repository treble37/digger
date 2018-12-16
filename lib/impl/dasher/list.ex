defimpl Digger.Dasher, for: List do
  alias Digger.Dasher
  alias Digger.Opts.Dasher, as: Opts

  def dasherize([], _opts), do: []

  def dasherize([h | t], opts) do
    opts = Opts.set_options(opts)
    [Dasher.dasherize(h, opts)] ++ Dasher.dasherize(t, opts)
  end
end
