defmodule AdventOfCode.Y2024.Day1Test do
  use ExUnit.Case, async: true

  test "measure how far apart two lists are" do
    distance = AdventOfCode.Y2024.Day1.find_distance(
      [3, 4, 2, 1, 3, 3],
      [4, 3, 5, 3, 9, 3]
    )

    assert distance == 11
  end

  test "similarity score of both lists" do
    similarity_score = AdventOfCode.Y2024.Day1.similarity_score(
      [3, 4, 2, 1, 3, 3],
      [4, 3, 5, 3, 9, 3]
    )

    assert similarity_score == 31
  end
end
