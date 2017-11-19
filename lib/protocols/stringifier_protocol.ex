defprotocol Digger.Stringifier.Protocol do
  @moduledoc """
  Documentation for Digger.Stringifier Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  Stringify the data type
  """

  @spec stringify(Types.data_type, Types.string) :: Types.valid_return_type
  def stringify(data_type, stringify)
end
