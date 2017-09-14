defmodule Digger.StringifierTest do
  use ExUnit.Case
  doctest Digger.Stringifier

  test "can stringify nested string keys" do
    atomized_map = %{:a => 2, :b => 3, %{:c => 4, :d => 5} => 6}
    assert Digger.Stringifier.stringify(atomized_map) == %{%{"c" => 4, "d" => 5} => 6,
      "a" => 2, "b" => 3}
  end

  test "does not stringify char lists, lists, or structs like date" do
    date = %Date{year: 2017, month: 3, day: 17}
    atomized_map = %{%{:e => 4, :f => 5} => 6, [1, 2] => 2,
                        %{:c => 3, 'ab' => 4, date => 1} => 7}
    assert Digger.Stringifier.stringify(atomized_map) == %{%{"e" => 4, "f" => 5} => 6, [1, 2] => 2,
                                                         %{"c" => 3, 'ab' => 4, date => 1} => 7}
  end

  test "can stringify the atomized empty string, as needed" do
    atomized_map = %{%{:e => 4, :f => "5"} => 6, :"" => [1, 2]}
    assert Digger.Stringifier.stringify(atomized_map) == %{%{"e" => 4, "f" => "5"} => 6,
                                                              "" => [1, 2]}
  end

  test "can stringify integers, as needed" do
    atomized_map = %{%{:e => 4, 0 => 5} => 6, :a => 2, 3 => 4}
    assert Digger.Stringifier.stringify(atomized_map) == %{%{"e" => 4, "0" => 5} => 6,
                                                          "a" => 2, "3" => 4}
  end
end
