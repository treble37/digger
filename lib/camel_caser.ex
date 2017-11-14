defmodule Digger.CamelCaser do
  @moduledoc """
  Documentation for Digger.CamelCaser
  """

  alias Digger.CamelCaser.Delegator

  @doc """
  Take a (nested) map and camel keys
  """
  def camel_case(data_type, first_letter \\ :upper), do: Delegator.camelize(data_type, first_letter)
end
