defmodule StoicCliTest do
  use ExUnit.Case
  doctest StoicCli

  test "greets the world" do
    assert StoicCli.hello() == :world
  end
end
