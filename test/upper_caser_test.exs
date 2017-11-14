defmodule Digger.UpperCaserTest do
  use ExUnit.Case
  doctest Digger.UpperCaser

  test "can upper case first letter of nested map atom keys" do
    stringified_map = %{:FooBar => 2, :snake_case => 3, %{:a_b_ba => 4, :area51 => 5} => 6, :c_bbda => 2}
    assert Digger.UpperCaser.upcase_first(stringified_map) ==
      %{:FooBar => 2, :Snake_case => 3, %{:A_b_ba => 4, :Area51 => 5} => 6, :C_bbda => 2}
  end

  test "can upper case first letter of nested map string keys" do
    stringified_map = %{"FooBar" => 2, "snake-case" => 3, %{"a_b_ba" => 4, "area51 is cool" => 5} => 6}
    assert Digger.UpperCaser.upcase_first(stringified_map) ==
      %{"FooBar" => 2, "Snake-case" => 3, %{"A_b_ba" => 4, "Area51 is cool" => 5} => 6}
  end

  test "does not deal with char lists, lists, or structs like date in nested map" do
    date = %Date{year: 2017, month: 3, day: 17}
    stringified_map = %{%{"e" => 4, :f => 5} => 6, [1, 2] => 2,
                        %{"c" => 3, 'aBBA' => 4, date => 1} => 7}
    assert Digger.UpperCaser.upcase_first(stringified_map) == %{%{"E" => 4, :F => 5} => 6, [1, 2] => 2,
                                                            %{"C" => 3, 'aBBA' => 4, date => 1} => 7}
  end
end
