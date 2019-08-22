defimpl Digger, for: Float do
  alias Digger.Opts.Atomizer, as: AOpts
  alias Digger.Opts.Stringifier, as: SOpts

  def atomize(float, opts) do
    atomicize(float, AOpts.set_options(opts))
  end

  def camel_case(any, _), do: any

  def dasherize(any, _opts), do: any

  def lowercase_first(any, _opts), do: any

  def snake_case(any, _opts), do: any

  def upcase_first(any, _opts), do: any

  def stringify(float, opts) do
    to_string(float, SOpts.set_options(opts))
  end

  # for atomize/2
  defp atomicize(float, type: :key, key_transform: :atomize, value_transform: _) do
    float
    |> to_atom()
  end

  defp atomicize(float, type: :value, key_transform: _, value_transform: :atomize) do
    float
    |> to_atom()
  end

  defp atomicize(float, _opts), do: float

  # for atomize/2
  defp to_atom(float) do
    float
    |> to_string
    |> String.to_atom()
  end

  # for stringify/2
  defp to_string(float, type: :key, key_transform: :stringify, value_transform: _),
    do: float |> Float.to_string()

  defp to_string(float, type: :value, key_transform: _, value_transform: :stringify),
    do: float |> Float.to_string()

  defp to_string(float, _), do: float
end
