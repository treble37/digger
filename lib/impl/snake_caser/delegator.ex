defmodule Digger.SnakeCaser.Delegator do
  defdelegate underscore(data_type), to: Digger.SnakeCaser.Protocol
end
