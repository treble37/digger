defmodule Digger.LowerCaser do
  @moduledoc """
  Documentation for Digger.LowerCaser
  """

  alias Digger.LowerCaser.Delegator

  @doc """
  Lower case a valid Types.data_type according to the protocol implementation
  """
  def lowercase_first(data_type), do: Delegator.lowercase_first(data_type)
end
