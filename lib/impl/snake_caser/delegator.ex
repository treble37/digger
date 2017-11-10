defmodule Digger.SnakeCaser.Delegator do
  @moduledoc false

  defdelegate underscore(data_type), to: Digger.SnakeCaser.Protocol
end
