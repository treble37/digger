defimpl Digger.Stringifier, for: Map do
  alias Digger.Stringifier
  alias Digger.Opts.Stringifier, as: Opts

  def stringify(
        map,
        opts
      ) do
    opts = Opts.set_options(opts)

    map
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.merge(acc, %{
        Stringifier.stringify(key,
          type: :key,
          key_transform: Keyword.get(opts, :key_transform),
          value_transform: Keyword.get(opts, :value_transform)
        ) =>
          Stringifier.stringify(value,
            type: :value,
            key_transform: Keyword.get(opts, :key_transform),
            value_transform: Keyword.get(opts, :value_transform)
          )
      })
    end)
  end
end
