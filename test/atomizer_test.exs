defmodule Digger.AtomizerTest do
  use ExUnit.Case

  setup do
    %{date: %Date{year: 2017, month: 3, day: 17}}
  end

  test "can atomize nested string keys" do
    stringified_map = %{"a" => 2, "b" => 3, %{"c" => 4, "d" => 5} => 6}

    assert Digger.Atomizer.atomize(stringified_map) ==
             %{%{:c => 4, :d => 5} => 6, :a => 2, :b => 3}
  end

  test "can atomize nested string values" do
    stringified_map = %{"a" => 2, "b" => 3, %{"c" => 4, "d" => 5} => 6}

    assert Digger.Atomizer.atomize(stringified_map,
             type: :value,
             atomize_key: false,
             atomize_value: true
           ) == %{"a" => :"2", "b" => :"3", %{"c" => :"4", "d" => :"5"} => :"6"}
  end

  test "does not atomize structs like date", %{date: date} do
    stringified_map = %{
      %{"e" => 4, :f => 5} => 6,
      [1, 2] => 2,
      %{"c" => 3, 'ab' => 4, date => 1} => 7
    }

    assert Digger.Atomizer.atomize(stringified_map) ==
             %{
               %{:e => 4, :f => 5} => 6,
               [:"1", :"2"] => 2,
               %{:c => 3, [:"97", :"98"] => 4, date => 1} => 7
             }
  end

  test "can atomize the empty string, as needed" do
    stringified_map = %{%{"e" => 4, :f => %{"g" => "5"}} => 6, "" => [1, 2]}

    assert Digger.Atomizer.atomize(stringified_map) ==
             %{%{:e => 4, :f => %{:g => "5"}} => 6, :"" => [1, 2]}
  end

  test "can atomize integers and floats, as needed" do
    stringified_map = %{%{"e" => 4, 0 => 5, 1.02 => 2.0} => 6, "a" => 2, 3 => 4}

    assert Digger.Atomizer.atomize(stringified_map) ==
             %{%{:e => 4, :"0" => 5, :"1.02" => 2.0} => 6, :a => 2, :"3" => 4}
  end

  test "can atomize lists, as needed" do
    nested_list = [
      1,
      1.02,
      ["a", "b", ["c", "d"]],
      [%{"r_key" => [%{"y_key" => "banjo_guitar", "z" => [%{"a" => "b"}]}]}]
    ]

    assert Digger.Atomizer.atomize(nested_list) == [
             :"1",
             :"1.02",
             [:a, :b, [:c, :d]],
             [%{r_key: [%{y_key: "banjo_guitar", z: [%{a: "b"}]}]}]
           ]
  end
end
