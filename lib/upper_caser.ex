defmodule Digger.UpperCaser do
  @moduledoc """
  Documentation for Digger.UpperCaser
  """

  alias Digger.UpperCaser.Delegator

  @doc """
  Upper case the first letter of a valid Types.data_type according to
  the protocol implementation
  """
  def upcase_first(data_type), do: Delegator.upcase_first(data_type)
end
