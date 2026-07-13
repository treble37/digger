defmodule DeprecationRegressionTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "camel_case emits no deprecation warnings" do
    output =
      capture_io(:stderr, fn ->
        Digger.camel_case(%{some_key: "some_value", nested_map: %{another_key: 1}})
      end)

    assert output == ""
  end
end
