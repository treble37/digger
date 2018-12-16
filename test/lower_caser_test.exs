defmodule Digger.LowerCaserTest do
  use ExUnit.Case

  test "can lower case first letter of nested map atom keys" do
    stringified_map = %{
      :FooBar => 2,
      :Snake_Case => 3,
      %{:Ab_ba => 4, :area51 => 5} => 6,
      :C_bbda => 2
    }

    assert Digger.LowerCaser.lowercase_first(stringified_map) ==
             %{:fooBar => 2, :snake_Case => 3, %{:ab_ba => 4, :area51 => 5} => 6, :c_bbda => 2}
  end

  test "can lower case first letter of nested map string keys" do
    stringified_map = %{
      "FooBar" => 2,
      "Snake-case" => 3,
      %{"Abba" => 4, "Area51 Is Cool" => 5} => 6
    }

    assert Digger.LowerCaser.lowercase_first(stringified_map) ==
             %{"fooBar" => 2, "snake-case" => 3, %{"abba" => 4, "area51 Is Cool" => 5} => 6}
  end

  test "does not deal with char lists or structs like date in nested map" do
    date = %Date{year: 2017, month: 3, day: 17}

    stringified_map = %{
      %{"E" => 4, :F => 5} => 6,
      [1, 2] => 2,
      %{"C" => 3, 'ABBA' => 4, date => 1} => 7
    }

    assert Digger.LowerCaser.lowercase_first(stringified_map) == %{
             %{"e" => 4, :f => 5} => 6,
             [1, 2] => 2,
             %{"c" => 3, 'ABBA' => 4, date => 1} => 7
           }
  end

  test "can lower case first letter of each list element, as needed" do
    list = [1, 2, 'ABBA', "FooBar", "Snake-case", ["Abba", "Area51 Is Cool"]]

    assert Digger.LowerCaser.lowercase_first(list) == [
             1,
             2,
             'ABBA',
             "fooBar",
             "snake-case",
             ["abba", "area51 Is Cool"]
           ]
  end

  test "can lower case first letter of each (nested) list element, as needed" do
    list = [["Abba", "Area51 Is Cool"], [%{"Rkey" => [%{"Ykey" => "Banjo_Guitar"}]}]]

    assert Digger.LowerCaser.lowercase_first(list) == [
             ["abba", "area51 Is Cool"],
             [%{"rkey" => [%{"ykey" => "Banjo_Guitar"}]}]
           ]
  end
end
