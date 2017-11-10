defimpl Digger.SnakeCaser.Protocol, for: BitString do
  def underscore(string) do
    string
    |> String.replace(~r/([A-Z\d]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.replace(~r/-/, "_")
    |> String.downcase
  end
end