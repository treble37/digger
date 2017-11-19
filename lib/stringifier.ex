defmodule Digger.Stringifier do
  @moduledoc """
  Documentation for Digger.Stringifier.
  """

  alias Digger.Stringifier.Delegator

  @type key :: any
  @type value :: any
  @type pseudo_map :: any

  @doc """
  'Stringify' a valid Types.data_type according to the protocol implementation
  """

  @spec stringify(map, Types.string_arg) :: map
  def stringify(map, stringify \\ "stringify"), do: Delegator.stringify(map, stringify)

end
