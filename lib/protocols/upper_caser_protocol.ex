defprotocol Digger.UpperCaser.Protocol do
  @moduledoc """
  This protocol defines the API for functions which take a valid Elixir data type as input.
  """

  @fallback_to_any true

  @doc """
  Uppercase first letter of the data type
  """

  @spec upcase_first(Types.data_type) :: Types.valid_return_type
  def upcase_first(data_type)
end
