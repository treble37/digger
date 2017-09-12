defmodule Nested.Atomizer do
  @moduledoc """
  Documentation for NestedAtomizer.
  """

  def atomize(map = %{}) do
    map
    |> Enum.map(fn{k, v} -> {atomize_key(k), atomize_value(v)} end)
    |> Enum.into(%{})
  end

  def atomize(pseudo_map), do: pseudo_map

  defp atomize_value(value) when is_map(value) do
    atomize(value)
  end

  defp atomize_value(value), do: value

  defp atomize_key(key) when is_map(key) do
    atomize(key)
  end

  defp atomize_key(key) when is_binary(key) do
    String.to_atom(key)
  end

  defp atomize_key(key) when is_integer(key) do
    key |> to_string |> atomize_key
  end

  defp atomize_key(key), do: key
end
