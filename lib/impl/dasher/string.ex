defimpl Digger.Dasher, for: BitString do
  def dasherize(string) do
    string
    |> String.replace(~r/_/, "-")
  end
end
