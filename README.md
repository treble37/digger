# Digger

[![Build Status](https://travis-ci.org/treble37/digger.svg?branch=master)](https://travis-ci.org/treble37/digger)
[![Code Climate](https://codeclimate.com/github/treble37/digger/badges/gpa.svg)](https://codeclimate.com/github/treble37/digger)
[![Coverage Status](https://coveralls.io/repos/github/treble37/digger/badge.svg)](https://coveralls.io/github/treble37/digger)
[![Test Coverage](https://api.codeclimate.com/v1/badges/702151ab4712380d7d49/test_coverage)](https://codeclimate.com/github/treble37/digger/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/702151ab4712380d7d49/maintainability)](https://codeclimate.com/github/treble37/digger/maintainability)
[![Hex.pm](https://img.shields.io/hexpm/v/digger.svg)](https://hex.pm/packages/digger)
[![Hex.pm Downloads](https://img.shields.io/hexpm/dt/digger.svg)](https://hex.pm/packages/digger)
[![Deps Status](https://beta.hexfaktor.org/badge/all/github/treble37/digger.svg)](https://beta.hexfaktor.org/github/treble37/digger)
[![Inline docs](http://inch-ci.org/github/treble37/digger.svg?branch=master)](http://inch-ci.org/github/treble37/digger)
[![GitHub stars](https://img.shields.io/github/stars/treble37/digger.svg)](https://github.com/treble37/digger/stargazers)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/treble37/digger/master/LICENSE)

## Description

Digger is a collection of helpers to help you operate on nested maps (it will also work on non-nested maps). Elixir gives you a great collection of map methods, but sometimes I find myself having to rewrite the same operations specifically for nested maps.

This library is intended to help your code stay [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

## Possible Future Work

This library is a work in progress. I'm thinking about extending it to lists and/or tuples.

## Here is a list of helper modules/methods Digger gives you:

## 1 - Digger.Atomizer

### The Problem

You have a valid data type that needs to be "atomized" This can be a string, number, or nested map with string keys.

### The Solution: Digger.Atomizer

Digger.Atomizer drills down into a nested map and converts (most) keys which are not atoms into atoms.

## 2 - Digger.Stringifier

### The Problem

You have a nested map (or a struct that you converted to a nested map) with keys that are atoms and you want to convert those keys to strings.

You have a valid data type that needs to be "stringified" This can be an atom, number, or nested map with atom keys.

### The Solution: Digger.Stringifier

Digger.Stringifier drills down into a nested map and converts (most) keys which are not strings into strings.

## 3 - Digger.CamelCaser

### The Problem

You have a valid data type that needs to be camel-cased. This can be an atom, string, or nested map (or a struct that you converted to a nested map) with string or atom keys.

### The Solution: Digger.CamelCaser

Digger.CamelCaser "camel cases" your valid data type according to the rules defined by its protocol.

## 4 - Digger.SnakeCaser

### The Problem

You have a valid data type that needs to be snake-cased. This can be an atom, string, or nested map (or a struct that you converted to a nested map) with string or atom keys.

### The Solution: Digger.SnakeCaser

Digger.SnakeCaser "snake cases" your valid data type according to the rules defined by its protocol.

## 5 - Digger.Dasher

### The Problem

You have a valid data type that needs the underscores transformed to dashes. This can be a string, or nested map (or a struct that you converted to a nested map) with string keys.

### The Solution: Digger.Dasher

Digger.Dasher "dasherizes" your valid data type according to the rules defined by its protocol.

## 6 - Digger.LowerCaser

### The Problem

You have a valid data type that needs the first letter to be lowercase. This can be a string or atom or nested map with string or atom keys.

### The Solution: Digger.LowerCaser

Digger.Dasher "lowercases" your valid data type according to the rules defined by its protocol.

## 7 - Digger.UpperCaser

### The Problem

You have a valid data type that needs the first letter to be upper case. This can be a string or atom or nested map with string or atom keys.

### The Solution: Digger.UpperCaser

Digger.Dasher "upcases" your valid data type according to the rules defined by its protocol.

## Questions?

The tests in the test folder show you the data types that are handled. The protocol implementations in lib/impl also show you the various data types are handled.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `digger` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:digger, "~> 1.0.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/digger](https://hexdocs.pm/digger).

