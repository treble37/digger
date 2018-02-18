defprotocol Digger.LowerCaser do
  @moduledoc """
  Documentation for Digger.LowerCaser Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  Lower case first letter of a valid Types.data_type according to the protocol implementation
  """

  @spec lowercase_first(Types.data_type) :: Types.valid_return_type
  def lowercase_first(data_type)
end
