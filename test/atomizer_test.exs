defmodule Digger.AtomizerTest do
  use ExUnit.Case

  setup do
    %{date: %Date{year: 2017, month: 3, day: 17}}
  end

  test "can atomize nested string keys" do
    stringified_map = %{"a" => 2, "b" => 3, %{"c" => 4, "d" => 5} => 6}

    assert Digger.atomize(stringified_map) ==
             %{%{:c => 4, :d => 5} => 6, :a => 2, :b => 3}
  end

  test "can atomize nested string values" do
    stringified_map = %{"a" => 2, "b" => 3, %{"c" => 4, "d" => 5} => 6}

    assert Digger.atomize(stringified_map,
             type: :value,
             key_transform: :no_atomize,
             value_transform: :atomize
           ) == %{"a" => :"2", "b" => :"3", %{"c" => :"4", "d" => :"5"} => :"6"}
  end

  test "does not atomize structs like date", %{date: date} do
    stringified_map = %{
      %{"e" => 4, :f => 5} => 6,
      [1, 2] => 2,
      %{"c" => 3, 'ab' => 4, date => 1} => 7
    }

    assert Digger.atomize(stringified_map) ==
             %{
               %{:e => 4, :f => 5} => 6,
               [:"1", :"2"] => 2,
               %{:c => 3, [:"97", :"98"] => 4, date => 1} => 7
             }
  end

  test "can atomize the empty string, as needed" do
    stringified_map = %{%{"e" => 4, :f => %{"g" => "5"}} => 6, "" => [1, 2]}

    assert Digger.atomize(stringified_map) ==
             %{%{:e => 4, :f => %{:g => "5"}} => 6, :"" => [1, 2]}
  end

  test "can atomize integers and floats, as needed" do
    stringified_map = %{%{"e" => 4, 0 => 5, 1.02 => 2.0} => 6, "a" => 2, 3 => 4}

    assert Digger.atomize(stringified_map) ==
             %{%{:e => 4, :"0" => 5, :"1.02" => 2.0} => 6, :a => 2, :"3" => 4}
  end

  test "can atomize lists, as needed" do
    nested_list = [
      1,
      1.02,
      ["a", "b", ["c", "d"]],
      [%{"r_key" => [%{"y_key" => "banjo_guitar", "z" => [%{"a" => "b"}]}]}]
    ]

    assert Digger.atomize(nested_list) == [
             :"1",
             :"1.02",
             [:a, :b, [:c, :d]],
             [%{r_key: [%{y_key: "banjo_guitar", z: [%{a: "b"}]}]}]
           ]
  end

  test "existing: true atomizes a string whose atom already exists" do
    # :a is referenced elsewhere in this module, so it's already in the atom table.
    assert Digger.atomize("a", existing: true) == :a
  end

  test "existing: true does not create a new atom for a novel string" do
    novel_string = "digger_atomizer_test_definitely_novel_#{System.unique_integer([:positive])}"
    count_before = :erlang.system_info(:atom_count)

    assert Digger.atomize(novel_string, existing: true) == novel_string

    assert :erlang.system_info(:atom_count) == count_before
  end

  test "existing: true is respected inside a nested map, leaving unknown string keys as-is" do
    novel_string = "digger_atomizer_test_nested_novel_#{System.unique_integer([:positive])}"
    stringified_map = %{"a" => 1, novel_string => 2}

    assert Digger.atomize(stringified_map, existing: true) == %{:a => 1, novel_string => 2}
  end
end
