defprotocol Digger.Stringifier do
  @moduledoc """
  Documentation for Digger.Stringifier Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  'Stringify' a valid Types.data_type according to the protocol implementation
  """

  @spec stringify(Types.data_type(), keyword()) :: Types.valid_return_type()
  def stringify(
        data_type,
        opts \\ [type: :key, key_transform: :stringify, value_transform: :none]
      )
end
