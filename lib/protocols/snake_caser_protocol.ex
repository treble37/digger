defprotocol Digger.SnakeCaser.Protocol do
  @moduledoc """
  This protocol defines the API for functions which take a valid Elixir data type as input.
  """

  @doc """
  Underscore the data type
  """
  def underscore(data_type)
end
