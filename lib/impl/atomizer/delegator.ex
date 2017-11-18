defmodule Digger.Atomizer.Delegator do
  @moduledoc false

  defdelegate atomize(data_type), to: Digger.Atomizer.Protocol
end
