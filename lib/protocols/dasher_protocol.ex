defprotocol Digger.Dasher do
  @moduledoc """
  Documentation for Digger.Dasher Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  'Dasherize' a valid Types.data_type according to the protocol implementation
  """

  @spec dasherize(Types.data_type(), keyword()) :: Types.valid_return_type()
  def dasherize(
        data_type,
        opts \\ [type: :key, key_transform: :dasherize, value_transform: :none]
      )
end
