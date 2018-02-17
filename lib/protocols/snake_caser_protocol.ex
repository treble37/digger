defprotocol Digger.SnakeCaser do
  @moduledoc """
  Documentation for Digger.SnakeCaser Protocol
  """

  @fallback_to_any true

  @doc """
  snake_case a valid Types.data_type according to the protocol implementation
  """

  @spec snake_case(Types.data_type) :: Types.valid_return_type
  def snake_case(data_type)
end
