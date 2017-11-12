defprotocol Digger.UpperCaser.Protocol do
  @moduledoc """
  This protocol defines the API for functions which take a valid Elixir data type as input.
  """

  @doc """
  Uppercase first letter of the data type
  """
  @fallback_to_any true
  def upcase_first(data_type)
end
