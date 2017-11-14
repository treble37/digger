defmodule Digger.UpperCaser do
  @moduledoc """
  Documentation for Digger.UpperCaser
  """

  alias Digger.UpperCaser.Delegator

  @doc """
  Take a (nested) map and underscore keys
  """
  def upcase_first(data_type), do: Delegator.upcase_first(data_type)
end
