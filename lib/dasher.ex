defmodule Digger.Dasher do
  @moduledoc """
  Documentation for Digger.Dasher
  """

  alias Digger.Dasher.Delegator

  @doc """
  Take a (nested) map and dasherize keys
  """
  def dasherize(data_type), do: Delegator.dasherize(data_type)
end
