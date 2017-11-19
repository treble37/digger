defmodule Digger.Stringifier do
  @moduledoc """
  Documentation for Digger.Stringifier.
  """

  alias Digger.Stringifier.Delegator

  @type key :: any
  @type value :: any
  @type pseudo_map :: any

  @doc """
  Take a (nested) map and convert atom and integer keys to strings
  """

  @spec stringify(map, Types.string_arg) :: map
  def stringify(map, stringify \\ "stringify"), do: Delegator.stringify(map, stringify)

end
