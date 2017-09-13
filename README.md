# Digger

[![Build Status](https://travis-ci.org/treble37/digger.svg?branch=master)](https://travis-ci.org/treble37/digger)
[![Code Climate](https://codeclimate.com/github/treble37/digger/badges/gpa.svg)](https://codeclimate.com/github/treble37/digger)
[![Coverage Status](https://coveralls.io/repos/github/treble37/digger/badge.svg?branch=master)](https://coveralls.io/github/treble37/digger?branch=master)
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

You have a nested map (or a struct that you converted to a nested map) with keys that are not atoms and you want to convert those keys to atoms. Typically, I've had this issue with maps with string keys.

### The Solution: Digger.Atomizer

Digger.Atomizer drills down into a nested map and converts keys which are not atoms into atoms.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `digger` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:digger, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/digger](https://hexdocs.pm/digger).

