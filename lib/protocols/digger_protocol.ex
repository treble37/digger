defprotocol Digger do
  @moduledoc """
  Documentation for Digger Protocol
  """

  @fallback_to_any true

  alias Digger.Types

  @doc """
  'Atomize' a valid Types.data_type according to the protocol implementation
  """

  @spec atomize(Types.data_type(), keyword()) :: Types.valid_return_type()
  def atomize(
        data_type,
        opts \\ [type: :key, key_transform: :atomize, value_transform: :none]
      )

  @doc """
  Camel case a valid Types.data_type according to the protocol implementation
  """

  @spec camel_case(Types.data_type(), keyword()) :: Types.valid_return_type()
  def camel_case(
        data_type,
        opts \\ [type: :key, key_transform: :upper, value_transform: :none]
      )

  @doc """
  'Dasherize' a valid Types.data_type according to the protocol implementation
  """

  @spec dasherize(Types.data_type(), keyword()) :: Types.valid_return_type()
  def dasherize(
        data_type,
        opts \\ [type: :key, key_transform: :dasherize, value_transform: :none]
      )

  @doc """
  Lower case first letter of a valid Types.data_type according to the protocol implementation
  """

  @spec lowercase_first(Types.data_type(), keyword()) :: Types.valid_return_type()
  def lowercase_first(
        data_type,
        opts \\ [type: :key, key_transform: :lower, value_transform: :none]
      )

  @doc """
  snake_case a valid Types.data_type according to the protocol implementation
  """

  @spec snake_case(Types.data_type(), keyword()) :: Types.valid_return_type()
  def snake_case(data_type, opts \\ [type: :key, key_transform: :snake, value_transform: :none])

  @doc """
  'Stringify' a valid Types.data_type according to the protocol implementation
  """

  @spec stringify(Types.data_type(), keyword()) :: Types.valid_return_type()
  def stringify(
        data_type,
        opts \\ [type: :key, key_transform: :stringify, value_transform: :none]
      )

  @doc """
  Upper case the first letter of a valid Types.data_type according to
  the protocol implementation
  """

  @spec upcase_first(Types.data_type(), keyword()) :: Types.valid_return_type()
  def upcase_first(
        data_type,
        opts \\ [type: :key, key_transform: :upper, value_transform: :none]
      )
end
