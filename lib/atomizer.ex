defmodule Digger.Atomizer do
  @moduledoc """
  Documentation for Digger.Atomizer.
  """

  alias Digger.Atomizer.Delegator

  @doc """
  'Atomize' a valid Types.data_type according to the protocol implementation
  """
  @spec atomize(map, Types.string_arg) :: map
  def atomize(map, atomize \\ "atomize"), do: Delegator.atomize(map, atomize)
end
