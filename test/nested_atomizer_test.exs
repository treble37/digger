defmodule NestedAtomizerTest do
  use ExUnit.Case
  doctest NestedAtomizer

  test "can atomize nested string keys" do
    stringified_map = %{"a" => 2, "b" => 3, %{"c" => 4, "d" => 5} => 6}
    assert NestedAtomizer.atomize(stringified_map) == %{%{:c => 4, :d => 5} => 6, :a => 2, :b => 3}
  end

  test "throws an error when atomizing a map with a struct key" do
    date = %Date{year: 2017, month: 3, day: 17}
    stringified_map = %{%{"e" => 4, :f => 5} => 6, "a" => 2,
                        %{"c" => 3, "d" => 4, date => 1} => 7}
    assert_raise Protocol.UndefinedError, ~r/protocol Enumerable not implemented for/,
      fn -> NestedAtomizer.atomize(stringified_map)
    end
  end

  test "can atomize the empty string, as needed" do
    stringified_map = %{%{"e" => 4, :f => "5"} => 6, "" => [1, 2]}
    assert NestedAtomizer.atomize(stringified_map) == %{%{:e => 4, :f => "5"} => 6, :"" => [1, 2]}
  end

  test "can atomize integers, as needed" do
    stringified_map = %{%{"e" => 4, 0 => 5} => 6, "a" => 2, 3 => 4}
    assert NestedAtomizer.atomize(stringified_map) == %{%{:e => 4, :"0" => 5} => 6,
                                                          :a => 2, :"3" => 4}
  end
end
