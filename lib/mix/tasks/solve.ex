defmodule Mix.Tasks.AdventOfCode.Solve do
  use Mix.Task

  @shortdoc "Solves an Advent of Code Puzzle for given year and day"

  @impl Mix.Task
  def run(args) do
    case parse_args(args) do
      {year, day} -> solve(year, day)
      :help -> print_help()
    end
  end

  defp parse_args(args) do
    case args do
      [year, day] -> {String.to_integer(year), day}
      _ -> :help
    end
  end

  defp solve(year, day) do
    module_name = module_for_day(year, day)

    if Code.ensure_loaded?(module_name) do
      IO.puts("Solving #{year} #{day}...")
      module_name.solve()
    else
      IO.puts("Solution for #{year} #{day} not found!")
      IO.puts("Expected module: #{module_name}")
    end
  end

  defp module_for_day(year, day) do
    # Build the full module name: AdventOfCode.Y2024.Day1
    Module.concat([AdventOfCode, "Y#{year}", day])
  end

  defp print_help do
    IO.puts """
    Usage: mix advent_of_code.solve <year> <day>
    Example: mix advent_of_code.solve 2024 day1
    """
  end
end

