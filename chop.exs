defmodule Chop do
  def guess(actual, range, answer \\ 1000)

  def guess(actual, _, answer) when actual == answer do
    IO.puts(actual)
  end

  def guess(actual, range, answer) when actual < answer do
    min.._ = range

    new_range = min..answer
    new_answer = min + div(answer - min, 2)
    IO.puts("Is it #{new_answer}")
    guess(actual, new_range, new_answer)
  end

  def guess(actual, range, answer) when actual > answer do
    _..max = range
    new_range = answer..max
    new_answer = answer + div(max - answer + 1, 2)
    IO.puts("Is it #{new_answer}")
    guess(actual, new_range, new_answer)
  end
end
