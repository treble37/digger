defprotocol Digger.LowerCaser.Protocol do
  @moduledoc """
  This protocol defines the API for functions which take a valid Elixir data type as input.
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  Lowercase first letter of the data type
  """

  @spec lowercase_first(Types.data_type) :: Types.valid_return_type
  def lowercase_first(data_type)
end
