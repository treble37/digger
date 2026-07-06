defmodule Digger.CoreTest do
  use ExUnit.Case

  @moduledoc """
  Characterization tests for value-side (`type: :value`) transform branches
  and float passthrough behavior that predate the Digger.Core refactor but
  were not previously exercised by the existing test suite.
  """

  test "upcase_first transforms an atom value and leaves a non-matching atom untouched" do
    assert Digger.upcase_first(:some_atom, type: :value, key_transform: :none, value_transform: :upper) ==
             :Some_atom

    assert Digger.upcase_first(:some_atom, type: :key, key_transform: :none, value_transform: :none) ==
             :some_atom
  end

  test "lowercase_first transforms an atom value and leaves a non-matching atom untouched" do
    assert Digger.lowercase_first(:Some_Atom,
             type: :value,
             key_transform: :none,
             value_transform: :lower
           ) == :some_Atom

    assert Digger.lowercase_first(:Some_Atom, type: :key, key_transform: :none, value_transform: :none) ==
             :Some_Atom
  end

  test "snake_case transforms an atom value and leaves a non-matching atom untouched" do
    assert Digger.snake_case(:FooBar, type: :value, key_transform: :none, value_transform: :snake) ==
             :foo_bar

    assert Digger.snake_case(:FooBar, type: :key, key_transform: :none, value_transform: :none) ==
             :FooBar
  end

  test "atomize transforms a string value" do
    assert Digger.atomize("hello", type: :value, key_transform: :no_atomize, value_transform: :atomize) ==
             :hello
  end

  test "camel_case on a string respects type: :key/:value with key_transform/value_transform :none" do
    assert Digger.camel_case("some_value", type: :key, key_transform: :none, value_transform: :none) ==
             "some_value"

    assert Digger.camel_case("foo_bar", type: :value, key_transform: :none, value_transform: :upper) ==
             "FooBar"
  end

  test "dasherize transforms a string value" do
    assert Digger.dasherize("foo_bar", type: :value, key_transform: :none, value_transform: :dasherize) ==
             "foo-bar"
  end

  test "lowercase_first transforms a string value" do
    assert Digger.lowercase_first("FooBar", type: :value, key_transform: :none, value_transform: :lower) ==
             "fooBar"
  end

  test "snake_case transforms a string value" do
    assert Digger.snake_case("FooBar", type: :value, key_transform: :none, value_transform: :snake) ==
             "foo_bar"
  end

  test "upcase_first transforms a string value" do
    assert Digger.upcase_first("fooBar", type: :value, key_transform: :none, value_transform: :upper) ==
             "FooBar"
  end

  test "stringify transforms a numeric value" do
    assert Digger.stringify(5, type: :value, key_transform: :none, value_transform: :stringify) == "5"
  end

  test "camel_case, dasherize, lowercase_first, snake_case, and upcase_first leave floats untouched" do
    assert Digger.camel_case(1.5) == 1.5
    assert Digger.dasherize(1.5) == 1.5
    assert Digger.lowercase_first(1.5) == 1.5
    assert Digger.snake_case(1.5) == 1.5
    assert Digger.upcase_first(1.5) == 1.5
  end
end
