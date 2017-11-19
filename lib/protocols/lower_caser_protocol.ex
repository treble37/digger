defprotocol Digger.LowerCaser.Protocol do
  @moduledoc """
  Documentation for Digger.LowerCaser Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  Lowercase first letter of the data type
  """

  @spec lowercase_first(Types.data_type) :: Types.valid_return_type
  def lowercase_first(data_type)
end
