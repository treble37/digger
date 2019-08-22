defimpl Digger, for: Atom do
  alias Digger.Opts.CamelCaser, as: CCOpts
  alias Digger.Opts.LowerCaser, as: LCOpts
  alias Digger.Opts.SnakeCaser, as: SCOpts
  alias Digger.Opts.Stringifier, as: SOpts
  alias Digger.Opts.UpperCaser, as: UCOpts

  def atomize(any, _opts), do: any

  def camel_case(atom, opts) do
    opts = CCOpts.set_options(opts)

    atom
    |> to_string
    |> Digger.camel_case(opts)
    |> String.to_atom()
  end

  def dasherize(any, _opts), do: any

  def lowercase_first(atom, opts) do
    opts = LCOpts.set_options(opts)

    atom
    |> to_lower(opts)
  end

  def snake_case(atom, opts) do
    opts = SCOpts.set_options(opts)

    atom
    |> to_snake(opts)
  end

  def stringify(atom, opts) do
    to_string(atom, SOpts.set_options(opts))
  end

  def upcase_first(atom, opts) do
    opts = UCOpts.set_options(opts)

    atom
    |> to_upper(opts)
  end

  defp to_upper(atom, type: :key, key_transform: :upper, value_transform: _) do
    atom
    |> to_string
    |> Digger.upcase_first()
    |> String.to_atom()
  end

  defp to_upper(atom, type: :value, key_transform: _, value_transform: :upper) do
    atom
    |> to_string
    |> Digger.upcase_first()
    |> String.to_atom()
  end

  defp to_upper(atom, _opts), do: atom

  # for lowercase_first/2
  defp to_lower(
         atom,
         [type: :key, key_transform: :lower, value_transform: _] = opts
       ),
       do: atom |> to_string |> Digger.lowercase_first(opts) |> String.to_atom()

  defp to_lower(
         atom,
         [type: :value, key_transform: _, value_transform: :lower] = opts
       ),
       do: atom |> to_string |> Digger.lowercase_first(opts) |> String.to_atom()

  defp to_lower(atom, _), do: atom

  # for snake_case/2
  defp to_snake(atom, [type: :key, key_transform: :snake, value_transform: _] = opts) do
    atom
    |> to_string
    |> Digger.snake_case(opts)
    |> String.to_atom()
  end

  defp to_snake(atom, [type: :value, key_transform: _, value_transform: :snake] = opts) do
    atom
    |> to_string
    |> Digger.snake_case(opts)
    |> String.to_atom()
  end

  defp to_snake(atom, _opts), do: atom

  # for stringify/2
  defp to_string(atom, type: :key, key_transform: :stringify, value_transform: _),
    do: atom |> Atom.to_string()

  defp to_string(atom, type: :value, value_transform: :stringify, value_transform: _),
    do: atom |> Atom.to_string()

  defp to_string(atom, _), do: atom
end
