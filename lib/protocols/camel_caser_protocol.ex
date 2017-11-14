defprotocol Digger.CamelCaser.Protocol do
  @moduledoc """
  Documentation for Digger.CamelCaser
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  Apply camel case to the data type
  """

  @spec camelize(Types.data_type, Types.symbol) :: Types.valid_return_type
  def camelize(data_type, first_letter)
end
