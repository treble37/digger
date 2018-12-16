defimpl Digger.LowerCaser, for: Map do
  alias Digger.LowerCaser
  alias Digger.Opts.LowerCaser, as: Opts

  def lowercase_first(map, opts) do
    opts = Opts.set_options(opts)

    map
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.merge(acc, %{
        LowerCaser.lowercase_first(key,
          type: :key,
          key_transform: Keyword.get(opts, :key_transform),
          value_transform: Keyword.get(opts, :value_transform)
        ) =>
          LowerCaser.lowercase_first(value,
            type: :value,
            key_transform: Keyword.get(opts, :key_transform),
            value_transform: Keyword.get(opts, :value_transform)
          )
      })
    end)
  end
end
