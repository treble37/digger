defimpl Digger.SnakeCaser, for: Atom do
  alias Digger.SnakeCaser
  alias Digger.Opts.SnakeCaser, as: Opts

  def snake_case(atom, opts) do
    opts = Opts.set_options(opts)

    atom
    |> to_snake(opts)
  end

  defp to_snake(atom, [type: :key, key_transform: :snake, value_transform: _] = opts) do
    atom
    |> to_string
    |> SnakeCaser.snake_case(opts)
    |> String.to_atom()
  end

  defp to_snake(atom, [type: :value, key_transform: _, value_transform: :snake] = opts) do
    atom
    |> to_string
    |> SnakeCaser.snake_case(opts)
    |> String.to_atom()
  end

  defp to_snake(atom, _opts), do: atom
end
