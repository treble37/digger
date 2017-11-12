defmodule Digger.UpperCaser.Delegator do
  @moduledoc false

  defdelegate upcase_first(data_type), to: Digger.UpperCaser.Protocol
end
