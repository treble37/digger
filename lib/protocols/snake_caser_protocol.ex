defprotocol Digger.SnakeCaser.Protocol do
  @moduledoc """
  This protocol defines the API for functions which take a valid Elixir data type as input.
  """

  @doc """
  Underscore the data type
  """
  @fallback_to_any true
  def underscore(data_type)
end
