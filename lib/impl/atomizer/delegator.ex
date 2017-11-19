defmodule Digger.Atomizer.Delegator do
  @moduledoc false

  defdelegate atomize(data_type, _atomize), to: Digger.Atomizer.Protocol
end
