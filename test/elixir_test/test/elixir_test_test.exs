defmodule ElixirTestTest do
  use ExUnit.Case
  doctest ElixirTest

  test "greets the world" do
    assert ElixirTest.hello() == :world
  end
end
