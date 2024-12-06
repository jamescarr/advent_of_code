defmodule AdventOfCode.Input do
  @moduledoc """
  A helper utility to avoid directly referencing the input files in
  each solution
  """
  def path_for(year, day) do
    Path.join([
      Application.app_dir(:advent_of_code, "priv"),
      "inputs",
      to_string(year),
      "day#{day}.txt"
    ])
  end

  def ensure_exists!(year, day) do
    path = path_for(year, day)
    unless File.exists?(path) do
      raise "Input file for year #{year} day #{day} not found at #{path}"
    end
    path
  end
end
