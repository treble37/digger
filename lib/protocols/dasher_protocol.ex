defprotocol Digger.Dasher.Protocol do
  @moduledoc """
  Documentation for Digger.Dasher Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  Dasherize the data type
  """

  @spec dasherize(Types.data_type) :: Types.valid_return_type
  def dasherize(data_type)
end
