defmodule Digger.Stringifier.Delegator do
  @moduledoc false

  defdelegate stringify(data_type, stringify), to: Digger.Stringifier.Protocol
end
