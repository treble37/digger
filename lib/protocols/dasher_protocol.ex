defprotocol Digger.Dasher.Protocol do
  @moduledoc """
  This protocol defines the API for functions which take a valid Elixir data type as input.
  """

  @doc """
  Dasherize first letter of the data type
  """
  @fallback_to_any true
  def dasherize(data_type)
end
