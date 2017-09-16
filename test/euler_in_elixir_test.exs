defmodule EulerInElixirTest do
  use ExUnit.Case
  doctest EulerInElixir

  test "greets the world" do
    assert EulerInElixir.hello() == :world
  end

  test "solves problem 1" do
    assert EulerInElixir.problem_1(1000) == 233168
  end

  test "solves problem 2" do
    assert EulerInElixir.problem_2([1, 2], 4000000) == 4613732
  end

  test "solves problem 3" do
    assert EulerInElixir.problem_3(600851475143) == 6857
  end

  test "solves problem 4" do
    assert EulerInElixir.problem_4(100, 999) == 906609
  end
end
