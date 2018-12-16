defimpl Digger.Atomizer, for: Map do
  alias Digger.Atomizer
  alias Digger.Opts.Atomizer, as: Opts

  def atomize(map, opts) do
    opts = Opts.set_options(opts)

    map
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.merge(acc, %{
        Atomizer.atomize(key,
          type: :key,
          key_transform: Keyword.get(opts, :key_transform),
          value_transform: Keyword.get(opts, :value_transform)
        ) =>
          Atomizer.atomize(value,
            type: :value,
            key_transform: Keyword.get(opts, :key_transform),
            value_transform: Keyword.get(opts, :value_transform)
          )
      })
    end)
  end
end
