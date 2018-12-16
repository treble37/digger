defmodule Digger.DasherTest do
  use ExUnit.Case

  test "will not dasherize nested map atom keys" do
    stringified_map = %{
      :foo_bar => 2,
      :snake_case => 3,
      %{:aBBa => 4, :area51 => 5} => 6,
      :cBBDA => 2
    }

    assert Digger.Dasher.dasherize(stringified_map) ==
             %{:foo_bar => 2, :snake_case => 3, %{:aBBa => 4, :area51 => 5} => 6, :cBBDA => 2}
  end

  test "can dasherize nested map string keys" do
    stringified_map = %{"foo_Bar" => 2, "snake_case" => 3, %{"aB_Ba" => 4, "area51" => 5} => 6}

    assert Digger.Dasher.dasherize(stringified_map) ==
             %{"foo-Bar" => 2, "snake-case" => 3, %{"aB-Ba" => 4, "area51" => 5} => 6}
  end

  test "allows user not to dasherize char lists, integer lists, or structs like date in nested map" do
    date = %Date{year: 2017, month: 3, day: 17}

    stringified_map = %{
      %{"e" => 4, :f => 5} => 6,
      [1, 2] => 2,
      %{"c" => 3, 'aB_BA' => 4, date => 1} => 7
    }

    assert Digger.Dasher.dasherize(stringified_map) == %{
             %{"e" => 4, :f => 5} => 6,
             [1, 2] => 2,
             %{"c" => 3, 'aB_BA' => 4, date => 1} => 7
           }
  end

  test "does dasherize lists, as needed" do
    list = [
      "foo_Bar",
      "snake_case",
      ["aB_Ba", "area51"],
      :foo_bar,
      [%{"r_key" => [%{"y_key" => "banjo_guitar"}]}]
    ]

    assert Digger.Dasher.dasherize(list) == [
             "foo-Bar",
             "snake-case",
             ["aB-Ba", "area51"],
             :foo_bar,
             [%{"r-key" => [%{"y-key" => "banjo_guitar"}]}]
           ]
  end
end
