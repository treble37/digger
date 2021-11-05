defimpl Digger, for: Integer do
  alias Digger.Opts.Atomizer, as: AOpts
  alias Digger.Opts.Stringifier, as: SOpts

  def atomize(integer, opts) do
    atomicize(integer, AOpts.set_options(opts))
  end

  def camel_case(any, _), do: any
  def dasherize(any, _opts), do: any
  def lowercase_first(any, _opts), do: any
  def snake_case(any, _opts), do: any
  def upcase_first(any, _opts), do: any

  def stringify(integer, opts) do
    to_string(integer, SOpts.set_options(opts))
  end

  # for stringify/2
  defp to_string(integer, type: :key, key_transform: :stringify, value_transform: _),
    do: integer |> Integer.to_string()

  defp to_string(integer, type: :value, key_transform: _, value_transform: :stringify),
    do: integer |> Integer.to_string()

  defp to_string(integer, _), do: integer

  # for atomize/2
  defp atomicize(integer, type: :key, key_transform: :atomize, value_transform: _) do
    integer
    |> to_atom()
  end

  defp atomicize(integer, type: :value, key_transform: _, value_transform: :atomize) do
    integer
    |> to_atom()
  end

  defp atomicize(integer, _opts), do: integer

  defp to_atom(integer) do
    integer
    |> to_string
    |> String.to_atom()
  end
end
