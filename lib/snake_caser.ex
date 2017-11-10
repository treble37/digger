defmodule Digger.SnakeCaser do
  @moduledoc """
  Documentation for Digger.SnakeCaser
  """

  alias Digger.SnakeCaser.Delegator

  @doc """
  Take a (nested) map and underscore keys
  """
  def snake_case(data_type), do: Delegator.underscore(data_type)
end
