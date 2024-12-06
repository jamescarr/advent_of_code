defmodule AdventOfCode.Y2024.Day1 do
  @behaviour AdventOfCode.SolutionBehaviour

  def solve do
    {left, right} = AdventOfCode.Input.ensure_exists!(2024, 1)
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    |> Enum.map(fn line ->
      [n1, n2] = String.split(line)
      {String.to_integer(n1), String.to_integer(n2)}
    end)
    |> Enum.unzip

    IO.puts("Distance between both lists: #{find_distance(left, right)}")
    IO.puts("Score of both lists: #{similarity_score(left, right)}")
  end

  def find_distance(left, right) do
    Enum.zip(Enum.sort(left), Enum.sort(right))
    |> Enum.map(fn {x, y} -> abs(x - y) end)
    |> Enum.sum
  end

  def similarity_score(left, right) do
    frequencies = Enum.frequencies(right)
    Enum.map(left, fn num ->
      num * Map.get(frequencies, num, 0)
    end)
    |> Enum.sum
  end

end
