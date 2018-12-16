defimpl Digger.SnakeCaser, for: List do
  alias Digger.SnakeCaser
  alias Digger.Opts.SnakeCaser, as: Opts

  def snake_case([], _opts), do: []

  def snake_case([h | t], opts) do
    opts = Opts.set_options(opts)
    [SnakeCaser.snake_case(h, opts)] ++ SnakeCaser.snake_case(t, opts)
  end
end
