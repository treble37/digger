defmodule Digger.DasherTest do
  use ExUnit.Case
  doctest Digger.Dasher

  test "will not dasherize nested map atom keys" do
    stringified_map = %{:foo_bar => 2, :snake_case => 3, %{:aBBa => 4, :area51 => 5} => 6, :cBBDA => 2}
    assert Digger.Dasher.dasherize(stringified_map) ==
      %{:foo_bar => 2, :snake_case => 3, %{:aBBa => 4, :area51 => 5} => 6, :cBBDA => 2}
  end

  test "can dasherize nested map string keys" do
    stringified_map = %{"foo_Bar" => 2, "snake_case" => 3, %{"aB_Ba" => 4, "area51" => 5} => 6}
    assert Digger.Dasher.dasherize(stringified_map) ==
      %{"foo-Bar" => 2, "snake-case" => 3, %{"aB-Ba" => 4, "area51" => 5} => 6}
  end

  test "does not dasherize char lists, lists, or structs like date in nested map" do
    date = %Date{year: 2017, month: 3, day: 17}
    stringified_map = %{%{"e" => 4, :f => 5} => 6, [1, 2] => 2,
                        %{"c" => 3, 'aBBA' => 4, date => 1} => 7}
    assert Digger.Dasher.dasherize(stringified_map) == %{%{"e" => 4, :f => 5} => 6, [1, 2] => 2,
                                                            %{"c" => 3, 'aBBA' => 4, date => 1} => 7}
  end
end
