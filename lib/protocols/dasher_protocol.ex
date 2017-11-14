defprotocol Digger.Dasher.Protocol do
  @moduledoc """
  This protocol defines the API for functions which take a valid Elixir data type as input.
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  Dasherize first letter of the data type
  """

  @spec dasherize(Types.data_type) :: Types.valid_return_type
  def dasherize(data_type)
end
