defimpl Digger, for: List do
  alias Digger.Opts.Atomizer, as: AOpts
  alias Digger.Opts.CamelCaser, as: CCOpts
  alias Digger.Opts.Dasher, as: DOpts
  alias Digger.Opts.LowerCaser, as: LCOpts
  alias Digger.Opts.SnakeCaser, as: SCOpts
  alias Digger.Opts.Stringifier, as: SOpts
  alias Digger.Opts.UpperCaser, as: UCOpts

  def atomize([], _opts), do: []

  def atomize([h | t], opts) do
    opts = AOpts.set_options(opts)
    [Digger.atomize(h, opts)] ++ Digger.atomize(t, opts)
  end

  def camel_case([], _opts), do: []

  def camel_case([h | t], opts) do
    opts = CCOpts.set_options(opts)
    [Digger.camel_case(h, opts)] ++ Digger.camel_case(t, opts)
  end

  def dasherize([], _opts), do: []

  def dasherize([h | t], opts) do
    opts = DOpts.set_options(opts)
    [Digger.dasherize(h, opts)] ++ Digger.dasherize(t, opts)
  end

  def lowercase_first([], _opts), do: []

  def lowercase_first([h | t], opts) do
    opts = LCOpts.set_options(opts)
    [Digger.lowercase_first(h, opts)] ++ Digger.lowercase_first(t, opts)
  end

  def snake_case([], _opts), do: []

  def snake_case([h | t], opts) do
    opts = SCOpts.set_options(opts)
    [Digger.snake_case(h, opts)] ++ Digger.snake_case(t, opts)
  end

  def stringify([], _), do: []

  def stringify(
        [h | t],
        opts
      ) do
    opts = SOpts.set_options(opts)
    [Digger.stringify(h, opts)] ++ Digger.stringify(t, opts)
  end

  def upcase_first([], _opts), do: []

  def upcase_first([h | t], opts) do
    opts = UCOpts.set_options(opts)
    [Digger.upcase_first(h, opts)] ++ Digger.upcase_first(t, opts)
  end
end
