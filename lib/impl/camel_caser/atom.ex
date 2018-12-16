defimpl Digger.CamelCaser, for: Atom do
  alias Digger.CamelCaser
  alias Digger.Opts.CamelCaser, as: Opts

  def camel_case(atom, opts) do
    opts = Opts.set_options(opts)

    atom
    |> to_string
    |> CamelCaser.camel_case(opts)
    |> String.to_atom()
  end
end
