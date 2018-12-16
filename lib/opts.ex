defmodule Digger.Opts do
  @moduledoc """
  A module to handle optional arguments for various protocol implementations
  """

  defmodule Atomizer do
    @moduledoc """
    A module to handle optional arguments for Atomizer
    """
    def set_options(opts) do
      [
        type: Keyword.get(opts, :type, :key),
        key_transform: Keyword.get(opts, :key_transform, :atomize),
        value_transform: Keyword.get(opts, :value_transform, :no_atomize)
      ]
    end
  end

  defmodule CamelCaser do
    @moduledoc """
    A module to handle optional arguments for CamelCaser
    """
    def set_options(opts) do
      [
        type: Keyword.get(opts, :type, :key),
        key_transform: Keyword.get(opts, :key_transform, :upper),
        value_transform: Keyword.get(opts, :value_transform, :none)
      ]
    end
  end

  defmodule Stringifier do
    @moduledoc """
    A module to handle optional arguments for Stringifier
    """
    def set_options(opts) do
      [
        type: Keyword.get(opts, :type, :key),
        key_transform: Keyword.get(opts, :key_transform, :stringify),
        value_transform: Keyword.get(opts, :value_transform, :none)
      ]
    end
  end

  defmodule Dasher do
    @moduledoc """
    A module to handle optional arguments for Dasher
    """
    def set_options(opts) do
      [
        type: Keyword.get(opts, :type, :key),
        key_transform: Keyword.get(opts, :key_transform, :dasherize),
        value_transform: Keyword.get(opts, :value_transform, :none)
      ]
    end
  end

  defmodule LowerCaser do
    @moduledoc """
    A module to handle optional arguments for LowerCaser
    """
    def set_options(opts) do
      [
        type: Keyword.get(opts, :type, :key),
        key_transform: Keyword.get(opts, :key_transform, :lower),
        value_transform: Keyword.get(opts, :value_transform, :none)
      ]
    end
  end

  defmodule SnakeCaser do
    @moduledoc """
    A module to handle optional arguments for SnakeCaser
    """
    def set_options(opts) do
      [
        type: Keyword.get(opts, :type, :key),
        key_transform: Keyword.get(opts, :key_transform, :snake),
        value_transform: Keyword.get(opts, :value_transform, :none)
      ]
    end
  end

  defmodule UpperCaser do
    @moduledoc """
    A module to handle optional arguments for SnakeCaser
    """
    def set_options(opts) do
      [
        type: Keyword.get(opts, :type, :key),
        key_transform: Keyword.get(opts, :key_transform, :upper),
        value_transform: Keyword.get(opts, :value_transform, :none)
      ]
    end
  end
end
