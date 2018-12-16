defimpl Digger.CamelCaser, for: Map do
  alias Digger.CamelCaser
  alias Digger.Opts.CamelCaser, as: Opts

  def camel_case(
        map,
        opts
      ) do
    opts = Opts.set_options(opts)

    map
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.merge(acc, %{
        CamelCaser.camel_case(key,
          type: :key,
          key_transform: Keyword.get(opts, :key_transform),
          value_transform: Keyword.get(opts, :value_transform)
        ) =>
          CamelCaser.camel_case(value,
            type: :value,
            key_transform: Keyword.get(opts, :key_transform),
            value_transform: Keyword.get(opts, :value_transform)
          )
      })
    end)
  end
end
