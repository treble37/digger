defprotocol Digger.Stringifier.Protocol do
  @moduledoc """
  Documentation for Digger.Stringifier
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  Atomize the data type
  """

  @spec stringify(Types.data_type, Types.string) :: Types.valid_return_type
  def stringify(data_type, stringify)
end
