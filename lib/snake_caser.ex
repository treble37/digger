defmodule Digger.SnakeCaser do
  alias Digger.SnakeCaser.Delegator

  def snake_case(data_type), do: Delegator.underscore(data_type)
end
