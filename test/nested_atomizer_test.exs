defmodule NestedAtomizerTest do
  use ExUnit.Case
  doctest NestedAtomizer

  test "can atomize nested string keys" do
    stringified_map = %{"a" => 2, "b" => 3, %{"c" => 4, "d" => 5} => 6}
    assert NestedAtomizer.atomize(stringified_map) == %{%{c: 4, d: 5} => 6, a: 2, b: 3}
  end

  test "can atomize a mix of nested string keys and structs, as needed" do
    naive_datetime = ~N[2000-01-01 23:00:07]
    stringified_map = %{%{"e" => 4, f: 5} => 6, "a" => 2,
                        %{"c" => 3, "d" => 4} => 7, naive_datetime => 6}
    assert NestedAtomizer.atomize(stringified_map) == %{%{c: 3, d: 4} => 7,
                                                        %{e: 4, f: 5} => 6, :a => 2,
                                                        naive_datetime => 6}
  end
end
