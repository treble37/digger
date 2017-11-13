defmodule Digger.LowerCaser do
  @moduledoc """
  Documentation for Digger.LowerCaser
  """

  alias Digger.LowerCaser.Delegator

  @doc """
  Take a (nested) map and lowercase first letter of key
  """
  def lowercase_first(data_type), do: Delegator.lowercase_first(data_type)
end
