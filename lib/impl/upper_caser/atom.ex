defimpl Digger.UpperCaser, for: Atom do
  alias Digger.UpperCaser
  alias Digger.Opts.UpperCaser, as: Opts

  def upcase_first(atom, opts) do
    opts = Opts.set_options(opts)

    atom
    |> to_upper(opts)
  end

  defp to_upper(atom, type: :key, key_transform: :upper, value_transform: _) do
    atom
    |> to_string
    |> UpperCaser.upcase_first()
    |> String.to_atom()
  end

  defp to_upper(atom, type: :value, key_transform: _, value_transform: :upper) do
    atom
    |> to_string
    |> UpperCaser.upcase_first()
    |> String.to_atom()
  end

  defp to_upper(atom, _opts), do: atom
end
