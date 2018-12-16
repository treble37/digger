defimpl Digger.UpperCaser, for: Map do
  alias Digger.UpperCaser
  alias Digger.Opts.UpperCaser, as: Opts

  def upcase_first(map, opts) do
    opts = Opts.set_options(opts)

    map
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.merge(acc, %{
        UpperCaser.upcase_first(key,
          type: :key,
          key_transform: Keyword.get(opts, :key_transform),
          value_transform: Keyword.get(opts, :value_transform)
        ) =>
          UpperCaser.upcase_first(value,
            type: :value,
            key_transform: Keyword.get(opts, :key_transform),
            value_transform: Keyword.get(opts, :value_transform)
          )
      })
    end)
  end
end
