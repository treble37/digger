defimpl Digger.SnakeCaser, for: Atom do
  alias Digger.SnakeCaser

  def snake_case(atom) do
    atom
    |> to_string
    |> SnakeCaser.snake_case
    |> String.to_atom
  end
end
