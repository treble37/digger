defmodule Digger.Atomizer.Delegator do
  @moduledoc false

  defdelegate atomize(data_type, atomize), to: Digger.Atomizer.Protocol
end
