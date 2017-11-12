defmodule Digger.CamelCaser.Delegator do
  @moduledoc false

  defdelegate camelize(data_type, first_letter), to: Digger.CamelCaser.Protocol
end
