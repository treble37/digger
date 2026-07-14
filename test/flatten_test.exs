defmodule Digger.FlattenTest do
  use ExUnit.Case

  setup do
    %{date: %Date{year: 2017, month: 3, day: 17}}
  end

  test "flattens a nested map into separator-joined string paths" do
    assert Digger.flatten(%{a: %{b: 1}}) == %{"a.b" => 1}
  end

  test "flattens deeply nested maps" do
    assert Digger.flatten(%{"a" => %{"b" => %{"c" => %{"d" => 4}}}}) ==
             %{"a.b.c.d" => 4}
  end

  test "converts atom, string, and integer path keys to strings" do
    assert Digger.flatten(%{:a => %{"b" => %{1 => "x"}}, "e" => 2}) ==
             %{"a.b.1" => "x", "e" => 2}
  end

  test "flattening the empty map returns the empty map" do
    assert Digger.flatten(%{}) == %{}
  end

  test "treats empty maps, lists, and structs as leaf values", %{date: date} do
    assert Digger.flatten(%{a: %{}, b: [1, 2], c: %{d: date}}) ==
             %{"a" => %{}, "b" => [1, 2], "c.d" => date}
  end

  test "flatten supports a custom separator" do
    assert Digger.flatten(%{"a" => %{"b" => 1}}, separator: "/") ==
             %{"a/b" => 1}
  end

  test "flatten passes non-map input through unchanged", %{date: date} do
    assert Digger.flatten("a") == "a"
    assert Digger.flatten([%{"a" => 1}]) == [%{"a" => 1}]
    assert Digger.flatten(:a) == :a
    assert Digger.flatten(1) == 1
    assert Digger.flatten(1.5) == 1.5
    assert Digger.flatten(date) == date
  end

  test "unflattens separator-joined string keys into nested maps" do
    assert Digger.unflatten(%{"a.b" => 1}) == %{"a" => %{"b" => 1}}
  end

  test "unflattens deep paths and merges shared prefixes" do
    assert Digger.unflatten(%{"a.b.c" => 1, "a.b.d" => 2, "e" => 3}) ==
             %{"a" => %{"b" => %{"c" => 1, "d" => 2}}, "e" => 3}
  end

  test "unflatten keeps non-string keys as-is, never split" do
    assert Digger.unflatten(%{:a => 1, "b.c" => 2}) ==
             %{:a => 1, "b" => %{"c" => 2}}
  end

  test "unflatten supports a custom separator" do
    assert Digger.unflatten(%{"a/b" => 1}, separator: "/") ==
             %{"a" => %{"b" => 1}}
  end

  test "unflatten passes non-map input through unchanged", %{date: date} do
    assert Digger.unflatten("a") == "a"
    assert Digger.unflatten([%{"a.b" => 1}]) == [%{"a.b" => 1}]
    assert Digger.unflatten(:a) == :a
    assert Digger.unflatten(1) == 1
    assert Digger.unflatten(1.5) == 1.5
    assert Digger.unflatten(date) == date
  end

  test "round trip is exact for string-keyed maps", %{date: date} do
    representative_maps = [
      %{},
      %{"a" => 1},
      %{"a" => %{"b" => %{"c" => %{"d" => 4}}}, "e" => [1, 2]},
      %{"a" => %{}, "b" => date, "c" => %{"d" => nil}}
    ]

    for map <- representative_maps do
      assert Digger.unflatten(Digger.flatten(map)) == map
    end
  end

  test "round trip on mixed-key maps yields the string-keyed equivalent" do
    mixed = %{:a => %{:b => 1, "c" => %{1 => "x"}}, "d" => 2}

    assert Digger.unflatten(Digger.flatten(mixed)) ==
             %{"a" => %{"b" => 1, "c" => %{"1" => "x"}}, "d" => 2}
  end
end
