defprotocol Digger.CamelCaser do
  @moduledoc """
  Documentation for Digger.CamelCaser Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  Camel case a valid Types.data_type according to the protocol implementation
  """

  @spec camel_case(Types.data_type(), keyword()) :: Types.valid_return_type()
  def camel_case(
        data_type,
        opts \\ [type: :key, first_letter_key: :upper, first_letter_value: :none]
      )
end
