defprotocol Digger.SnakeCaser.Protocol do
  @moduledoc """
  This protocol defines the API for functions which take a valid Elixir data type as input.
  """

  @fallback_to_any true

  @doc """
  Underscore the data type
  """

  @spec underscore(Types.data_type) :: Types.valid_return_type
  def underscore(data_type)
end
