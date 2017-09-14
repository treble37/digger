defmodule Digger.Stringifier do
  @moduledoc """
  Documentation for Digger.Stringifier.
  """

  @type key :: any
  @type value :: any
  @type pseudo_map :: any

  @doc """
  Take a (nested) map and convert atom and integer keys to strings
  """
  @spec stringify(map) :: map
  def stringify(%{} = map) do
    map
    |> Enum.map(fn{key, value} -> {stringify_key(key), stringify_value(value)} end)
    |> Enum.into(%{})
  end

  @spec stringify(pseudo_map) :: pseudo_map
  def stringify(pseudo_map), do: pseudo_map

  defp stringify_value(value) when is_map(value) do
    stringify(value)
  end

  defp stringify_value(value), do: value

  defp stringify_key(%_{} = struct), do: struct

  defp stringify_key(key) when is_atom(key) do
    key |> to_string
  end

  defp stringify_key(key) when is_map(key) do
    stringify(key)
  end

  defp stringify_key(key) when is_integer(key) do
    key |> to_string
  end

  defp stringify_key(key), do: key
end
