defprotocol Digger.SnakeCaser do
  @moduledoc """
  Documentation for Digger.SnakeCaser Protocol
  """

  @fallback_to_any true

  alias Digger.Types
   
  @doc """
  snake_case a valid Types.data_type according to the protocol implementation
  """

  @spec snake_case(Types.data_type(), keyword()) :: Types.valid_return_type()
  def snake_case(data_type, opts \\ [type: :key, key_transform: :snake, value_transform: :none])
end
