defmodule Digger.StringifierTest do
  use ExUnit.Case

  test "can stringify nested string keys" do
    atomized_map = %{:a => 2, :b => 3, %{:c => 4, :d => 5} => 6}

    assert Digger.Stringifier.stringify(atomized_map) ==
             %{%{"c" => 4, "d" => 5} => 6, "a" => 2, "b" => 3}
  end

  test "does not stringify char lists, lists, or structs like date" do
    date = %Date{year: 2017, month: 3, day: 17}
    atomized_map = %{%{:e => 4, :f => 5} => 6, [1, 2] => 2, %{:c => 3, 'ab' => 4, date => 1} => 7}

    assert Digger.Stringifier.stringify(atomized_map) ==
             %{
               %{"e" => 4, "f" => 5} => 6,
               ["1", "2"] => 2,
               %{"c" => 3, ["97", "98"] => 4, date => 1} => 7
             }
  end

  test "can stringify the atomized empty string, as needed" do
    atomized_map = %{%{:e => 4, :f => %{:g => "5"}} => 6, :"" => [1, 2]}

    assert Digger.Stringifier.stringify(atomized_map) ==
             %{%{"e" => 4, "f" => %{"g" => "5"}} => 6, "" => [1, 2]}
  end

  test "can stringify integers and floats, as needed" do
    atomized_map = %{%{:e => 4, 0 => 5, 1.02 => 2.0} => 6, :a => 2, 3 => 4}

    assert Digger.Stringifier.stringify(atomized_map) ==
             %{%{"e" => 4, "0" => 5, "1.02" => 2.0} => 6, "a" => 2, "3" => 4}
  end

  test "can stringify lists, as needed" do
    list = [[:e, 0, 1.02], :a, 3]
    assert Digger.Stringifier.stringify(list) == [["e", "0", "1.02"], "a", "3"]
  end
end
