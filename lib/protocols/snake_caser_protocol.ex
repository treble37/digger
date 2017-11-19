defprotocol Digger.SnakeCaser.Protocol do
  @moduledoc """
  Documentation for Digger.SnakeCaser Protocol
  """

  @fallback_to_any true

  @doc """
  Underscore the data type
  """

  @spec underscore(Types.data_type) :: Types.valid_return_type
  def underscore(data_type)
end
