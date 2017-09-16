defmodule EulerInElixir do
  @moduledoc """
  Documentation for EulerInElixir.
  """

  defp get_last(list) do
    Enum.take(list, -2)
      |> Enum.sum()
      |> List.wrap()
      |> Enum.concat(list)
      |> Enum.sort()
  end

  defp equal?(x, y) do
    x == y
  end

  defp palidrome?(num) do
    num
      |> Integer.to_string()
      |> String.reverse()
      |> String.to_integer()
      |> equal?(num)
  end

  defp get_factors(num, acc) when num <= acc, do: num
  defp get_factors(num, acc) when num > acc and rem(num, acc) == 0 do
    num
      |> div(acc)
      |> get_factors(acc + 1)
  end
  defp get_factors(num, acc) when num > acc and rem(num, acc) != 0 do
    get_factors(num, acc + 1)
  end

  @doc """
  Hello world.

  """
  def hello do
    :world
  end

  def problem_1(max) do
    limit = max - 1
    Enum.to_list(1..limit)
      |> Enum.filter(fn x -> rem(x, 5) == 0 or rem(x, 3) == 0 end)
      |> Enum.sum()
  end

  def problem_2(list, limit) do
    max = List.last(list)
    if max <= limit do
      new_list = get_last(list)
      problem_2(new_list, limit)
    else
      Enum.sum(Enum.filter(list, fn x -> rem(x, 2) == 0 end))
    end
  end
  
  def problem_3(limit) do
    get_factors(limit, 2)
  end

  def problem_4(min, max) do
    Enum.to_list(min..max)
      |> Enum.flat_map(fn x -> Enum.map(Enum.to_list(min..max), fn y -> x * y end) end)
      |> Enum.filter(fn x -> palidrome?(x) end)
      |> Enum.max()
  end
end
