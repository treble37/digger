defmodule Digger.SnakeCaser do
  @moduledoc """
  Documentation for Digger.SnakeCaser
  """

  alias Digger.SnakeCaser.Delegator

  @doc """
  Underscore a valid Types.data_type according to the protocol implementation
  """
  def snake_case(data_type), do: Delegator.underscore(data_type)
end
