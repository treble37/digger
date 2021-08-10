defprotocol Digger.UpperCaser do
  @moduledoc """
  Documentation for Digger.UpperCaser Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  Upper case the first letter of a valid Types.data_type according to
  the protocol implementation
  """

  @spec upcase_first(Types.data_type(), keyword()) :: Types.valid_return_type()
  def upcase_first(
        data_type,
        opts \\ [type: :key, key_transform: :upper, value_transform: :none]
      )
end
