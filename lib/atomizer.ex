defmodule Digger.Atomizer do
  @moduledoc """
  Documentation for Digger.Atomizer.
  """

  alias Digger.Atomizer.Delegator

  @type key :: any
  @type value :: any
  @type pseudo_map :: any

  @doc """
  Take a (nested) map and convert string and integer keys to atoms
  """
  @spec atomize(map) :: map
  def atomize(map), do: Delegator.atomize(map)
#  def atomize(%{} = map) do
#    map
#    |> Map.new(fn{key, value} -> {atomize_key(key), atomize_value(value)} end)
#  end

  defp atomize_value(value) when is_map(value) do
    atomize(value)
  end

  defp atomize_value(value), do: value

  defp atomize_key(%_{} = struct), do: struct

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
