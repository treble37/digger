defmodule Digger.Atomizer do
  @moduledoc """
  Documentation for Digger.Atomizer.
  """

  alias Digger.Atomizer.Delegator

  @doc """
  Take a (nested) map and convert string and integer keys to atoms
  """
  @spec atomize(map, Types.string_arg) :: map
  def atomize(map, atomize \\ "atomize"), do: Delegator.atomize(map, atomize)
end
