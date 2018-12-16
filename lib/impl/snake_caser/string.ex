defimpl Digger.SnakeCaser, for: BitString do
  alias Digger.Opts.SnakeCaser, as: Opts

  def snake_case(string, opts) do
    opts = Opts.set_options(opts)

    string
    |> to_snake(opts)
  end

  defp to_snake(string, type: :key, key_transform: :snake, value_transform: _) do
    string
    |> String.replace(~r/([A-Z\d]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.replace(~r/-/, "_")
    |> String.downcase()
  end

  defp to_snake(string, type: :value, key_transform: _, value_transform: :snake) do
    string
    |> String.replace(~r/([A-Z\d]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.replace(~r/-/, "_")
    |> String.downcase()
  end

  defp to_snake(string, _), do: string
end
