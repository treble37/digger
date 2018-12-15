defprotocol Digger.Atomizer do
  @moduledoc """
  Documentation for Digger.Atomizer Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  'Atomize' a valid Types.data_type according to the protocol implementation
  """

  @spec atomize(Types.data_type(), keyword()) :: Types.valid_return_type()
  def atomize(data_type, opts \\ [type: :key, atomize_key: true, atomize_value: false])
end
