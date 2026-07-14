defmodule Digger.Flattener do
  @moduledoc false

  alias Digger.Opts.Flattener, as: Opts

  def flatten(map, opts) do
    [separator: separator] = Opts.set_options(opts)
    do_flatten(map, nil, separator, %{})
  end

  def unflatten(map, opts) do
    [separator: separator] = Opts.set_options(opts)

    Enum.reduce(map, %{}, fn {key, value}, acc ->
      put_path(acc, split_key(key, separator), value)
    end)
  end

  defp do_flatten(map, prefix, separator, acc) do
    Enum.reduce(map, acc, fn {key, value}, acc ->
      path = join(prefix, key, separator)

      if is_map(value) and value != %{} and not is_struct(value) do
        do_flatten(value, path, separator, acc)
      else
        Map.put(acc, path, value)
      end
    end)
  end

  defp join(nil, key, _separator), do: to_string(key)
  defp join(prefix, key, separator), do: prefix <> separator <> to_string(key)

  defp split_key(key, separator) when is_binary(key),
    do: String.split(key, separator)

  defp split_key(key, _separator), do: [key]

  defp put_path(map, [key], value), do: Map.put(map, key, value)

  defp put_path(map, [key | rest], value) do
    inner =
      case Map.get(map, key) do
        %{} = existing when not is_struct(existing) -> existing
        _ -> %{}
      end

    Map.put(map, key, put_path(inner, rest, value))
  end
end
