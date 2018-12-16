defimpl Digger.SnakeCaser, for: Map do
  alias Digger.SnakeCaser
  alias Digger.Opts.SnakeCaser, as: Opts

  def snake_case(map, opts) do
    opts = Opts.set_options(opts)

    map
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.merge(acc, %{
        SnakeCaser.snake_case(key,
          type: :key,
          key_transform: Keyword.get(opts, :key_transform),
          value_transform: Keyword.get(opts, :value_transform)
        ) =>
          SnakeCaser.snake_case(value,
            type: :value,
            key_transform: Keyword.get(opts, :key_transform),
            value_transform: Keyword.get(opts, :value_transform)
          )
      })
    end)
  end
end
