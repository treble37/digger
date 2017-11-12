defprotocol Digger.CamelCaser.Protocol do
  @moduledoc """
  Documentation for Digger.CamelCaser
  """

  @doc """
  Apply camel case to the data type
  """
  @fallback_to_any true
  def camelize(data_type, first_letter)
end
