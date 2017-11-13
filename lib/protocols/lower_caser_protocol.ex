defprotocol Digger.LowerCaser.Protocol do
  @moduledoc """
  This protocol defines the API for functions which take a valid Elixir data type as input.
  """

  @doc """
  Lowercase first letter of the data type
  """
  @fallback_to_any true
  def lowercase_first(data_type)
end
