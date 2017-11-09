defimpl Digger.SnakeCaser.Protocol, for: Time do
  alias Digger.SnakeCaser.Delegator

  def underscore(time) do
    time
  end
end
