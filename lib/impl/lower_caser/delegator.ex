defmodule Digger.LowerCaser.Delegator do
  @moduledoc false

  defdelegate lowercase_first(data_type), to: Digger.LowerCaser.Protocol
end
