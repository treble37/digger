defimpl Digger.Dasher, for: BitString do
  alias Digger.Opts.Dasher, as: Opts

  def dasherize(string, opts) do
    to_dash(string, Opts.set_options(opts))
  end

  defp to_dash(string, type: :key, key_transform: :dasherize, value_transform: _),
    do: string |> String.replace(~r/_/, "-")

  defp to_dash(string, type: :value, key_transform: _, value_transform: :dasherize),
    do: string |> String.replace(~r/_/, "-")

  defp to_dash(string, _), do: string
end
