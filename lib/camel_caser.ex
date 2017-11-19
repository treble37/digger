defmodule Digger.CamelCaser do
  @moduledoc """
  Documentation for Digger.CamelCaser
  """

  alias Digger.CamelCaser.Delegator

  @doc """
  Camel case a valid Types.data_type according to the protocol implementation
  """
  def camel_case(data_type, first_letter \\ :upper), do: Delegator.camelize(data_type, first_letter)
end
