defmodule Digger.Dasher.Delegator do
  @moduledoc false

  defdelegate dasherize(data_type), to: Digger.Dasher.Protocol
end
