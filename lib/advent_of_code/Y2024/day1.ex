defmodule AdventOfCode.Y2024.Day1 do
  @behaviour AdventOfCode.SolutionBehaviour

  def solve do
    {list1, list2} = AdventOfCode.Input.ensure_exists!(2024, 1)
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    |> Enum.map(fn line ->
      [n1, n2] = String.split(line)
      {String.to_integer(n1), String.to_integer(n2)}
    end)
    |> Enum.unzip

    IO.puts(find_distance(list1, list2))
  end

  def find_distance(list1, list2) do
    sorted_list1 = list1 |> Enum.sort
    sorted_list2 = list2 |> Enum.sort

    Enum.zip(sorted_list1, sorted_list2)
    |> Enum.map(fn {x, y} -> abs(x - y) end)
    |> Enum.sum
  end
end
