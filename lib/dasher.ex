defmodule Digger.Dasher do
  @moduledoc """
  Documentation for Digger.Dasher
  """

  alias Digger.Dasher.Delegator

  @doc """
  'Dasherize' a valid Types.data_type according to the protocol implementation
  """
  def dasherize(data_type), do: Delegator.dasherize(data_type)
end
