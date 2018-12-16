defimpl Digger.Stringifier, for: Float do
  alias Digger.Opts.Stringifier, as: Opts

  def stringify(float, opts) do
    to_string(float, Opts.set_options(opts))
  end

  defp to_string(float, type: :key, key_transform: :stringify, value_transform: _),
    do: float |> Float.to_string()

  defp to_string(float, type: :value, key_transform: _, value_transform: :stringify),
    do: float |> Float.to_string()

  defp to_string(float, _), do: float
end
