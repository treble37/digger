defimpl Digger.CamelCaser, for: List do
  alias Digger.CamelCaser
  alias Digger.Opts.CamelCaser, as: Opts

  def camel_case([], _opts), do: []

  def camel_case([h | t], opts) do
    opts = Opts.set_options(opts)
    [CamelCaser.camel_case(h, opts)] ++ CamelCaser.camel_case(t, opts)
  end
end
