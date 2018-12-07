defmodule Digger.SnakeCaserTest do
  use ExUnit.Case

  test "can snake case nested map atom keys" do
    stringified_map = %{
      :FooBar => 2,
      :snake_case => 3,
      %{:aBBa => 4, :Area51 => 5} => 6,
      :cBBDA => 2
    }

    assert Digger.SnakeCaser.snake_case(stringified_map) ==
             %{:foo_bar => 2, :snake_case => 3, %{:a_b_ba => 4, :area51 => 5} => 6, :c_bbda => 2}
  end

  test "can snake case nested map string keys" do
    stringified_map = %{"FooBar" => 2, "snake-case" => 3, %{"aBBa" => 4, "Area51" => 5} => 6}

    assert Digger.SnakeCaser.snake_case(stringified_map) ==
             %{"foo_bar" => 2, "snake_case" => 3, %{"a_b_ba" => 4, "area51" => 5} => 6}
  end

  test "does not snake case char lists, lists, or structs like date in nested map" do
    date = %Date{year: 2017, month: 3, day: 17}

    stringified_map = %{
      %{"e" => 4, :f => 5} => 6,
      [1, 2] => 2,
      %{"c" => 3, 'aBBA' => 4, date => 1} => 7
    }

    assert Digger.SnakeCaser.snake_case(stringified_map) == %{
             %{"e" => 4, :f => 5} => 6,
             [1, 2] => 2,
             %{"c" => 3, 'aBBA' => 4, date => 1} => 7
           }
  end

  test "can snake case lists, as needed" do
    list = [[1, 2], "FooBar", "snake-case", ["aBBa", "Area51", "logoutSession", "LogoutSession"]]

    assert Digger.SnakeCaser.snake_case(list) == [
             [1, 2],
             "foo_bar",
             "snake_case",
             ["a_b_ba", "area51", "logout_session", "logout_session"]
           ]
  end
end
