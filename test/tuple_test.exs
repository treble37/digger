defmodule Digger.TupleTest do
  use ExUnit.Case

  setup do
    %{date: %Date{year: 2017, month: 3, day: 17}}
  end

  test "camel cases the payload of a tagged 2-tuple, leaving the tag alone" do
    assert Digger.camel_case({:ok, %{user_id: 1}}) == {:ok, %{UserId: 1}}
  end

  test "the tag is never transformed, only the payload" do
    assert Digger.camel_case({:user_id, %{user_id: 1}}) ==
             {:user_id, %{UserId: 1}}
  end

  test "atomizes the payload of a tagged 2-tuple" do
    assert Digger.atomize({:error, %{"reason" => "nope"}}) ==
             {:error, %{reason: "nope"}}
  end

  test "atomize existing: true propagates into the payload" do
    assert Digger.atomize({:ok, %{"no_such_atom_tuple_qq" => 1}}, existing: true) ==
             {:ok, %{"no_such_atom_tuple_qq" => 1}}
  end

  test "stringifies the payload of a tagged 2-tuple" do
    assert Digger.stringify({:ok, %{user: %{name: "Ada"}}}) ==
             {:ok, %{"user" => %{"name" => "Ada"}}}
  end

  test "snake cases the payload of a tagged 2-tuple" do
    assert Digger.snake_case({:ok, %{"userId" => 1}}) ==
             {:ok, %{"user_id" => 1}}
  end

  test "dasherizes the payload of a tagged 2-tuple" do
    assert Digger.dasherize({:ok, %{"foo_bar" => 1}}) == {:ok, %{"foo-bar" => 1}}
  end

  test "lower cases the first letter of payload keys in a tagged 2-tuple" do
    assert Digger.lowercase_first({:ok, %{"FooBar" => 1}}) ==
             {:ok, %{"fooBar" => 1}}
  end

  test "upper cases the first letter of payload keys in a tagged 2-tuple" do
    assert Digger.upcase_first({:ok, %{"fooBar" => 1}}) ==
             {:ok, %{"FooBar" => 1}}
  end

  test "transforms tagged 2-tuples nested inside maps and lists" do
    assert Digger.stringify(%{result: {:ok, %{id: 7}}}) ==
             %{"result" => {:ok, %{"id" => 7}}}

    assert Digger.stringify([{:ok, %{id: 7}}]) == [{:ok, %{"id" => 7}}]
  end

  test "calendar structs inside a tuple payload still pass through", %{date: date} do
    assert Digger.stringify({:ok, %{date: date}}) == {:ok, %{"date" => date}}
  end

  test "non-conforming tuples pass through unchanged" do
    assert Digger.camel_case({1, 2, 3}) == {1, 2, 3}
    assert Digger.camel_case({"a", "b"}) == {"a", "b"}
    assert Digger.atomize({:ok, %{"a" => 1}, :extra}) == {:ok, %{"a" => 1}, :extra}
    assert Digger.stringify({}) == {}
  end

  test "flatten and unflatten treat tuples as leaves, per the non-map contract" do
    assert Digger.flatten({:ok, %{a: %{b: 1}}}) == {:ok, %{a: %{b: 1}}}
    assert Digger.unflatten({:ok, %{"a.b" => 1}}) == {:ok, %{"a.b" => 1}}
  end
end
