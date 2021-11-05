defmodule Digger.CamelCaserTest do
  use ExUnit.Case

  test "can camel case nested map atom keys" do
    stringified_map = %{
      :FooBar => 2,
      :snake_case => 3,
      %{:a_b_ba => 4, :area51 => 5} => 6,
      :c_bbda => 2
    }

    assert Digger.camel_case(stringified_map) ==
             %{:FooBar => 2, :SnakeCase => 3, %{:ABBa => 4, :Area51 => 5} => 6, :CBbda => 2}
  end

  test "allows camel case to not capitalize first letter" do
    stringified_map = %{
      :FooBar => 2,
      :snake_case => 3,
      %{:a_b_ba => 4, :area51 => 5} => 6,
      :c_bbda => 2
    }

    assert Digger.camel_case(stringified_map,
             type: :key,
             key_transform: :lower,
             value_transform: :none
           ) == %{:fooBar => 2, :snakeCase => 3, %{:aBBa => 4, :area51 => 5} => 6, :cBbda => 2}
  end

  test "can camel case nested map string keys" do
    stringified_map = %{"FooBar" => 2, "snake-case" => 3, %{"a_b_ba" => 4, "area51" => 5} => 6}

    assert Digger.camel_case(stringified_map) ==
             %{"FooBar" => 2, "SnakeCase" => 3, %{"ABBa" => 4, "Area51" => 5} => 6}
  end

  test "does not camel case char lists, lists, or structs like date in nested map" do
    date = %Date{year: 2017, month: 3, day: 17}

    stringified_map = %{
      %{"e" => 4, :f => 5} => 6,
      [1, 2] => 2,
      %{"c" => 3, 'aBBA' => 4, date => 1} => 7
    }

    assert Digger.camel_case(stringified_map) == %{
             %{"E" => 4, :F => 5} => 6,
             [1, 2] => 2,
             %{"C" => 3, 'aBBA' => 4, date => 1} => 7
           }
  end

  test "can camel case lists, as needed" do
    list = [1, 2, ['ab', "c", "a_b_ba", "area51", ["snake-case", "snake_case"]]]

    assert Digger.camel_case(list) == [
             1,
             2,
             ['ab', "C", "ABBa", "Area51", ["SnakeCase", "SnakeCase"]]
           ]
  end

  test "can camel case lists with nested maps with lowercase first letter, as needed" do
    list = [
      1,
      2,
      ['ab', "c", "a_b_ba", "area51", ["snake-case", "snake_case"]],
      [%{"r_key" => [%{"y_key" => "banjo_guitar"}]}]
    ]

    assert Digger.camel_case(list,
             type: :key,
             key_transform: :lower,
             value_transform: :none
           ) == [
             1,
             2,
             ['ab', "c", "aBBa", "area51", ["snakeCase", "snakeCase"]],
             [%{"rKey" => [%{"yKey" => "banjo_guitar"}]}]
           ]
  end
end
