defmodule Swapper do
  def swap([]), do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap([_]), do: raise("Can't swap a list with an odd number of list.")
end

defmodule WeatherHistory do
  def for_location_27([], _target_loc), do: []

  def for_location_27([head = [_, target_loc, _, _] | tail], target_loc) do
    [head | for_location_27(tail, target_loc)]
  end

  def for_location_27([_ | tail], target_loc), do: for_location_27(tail, target_loc)

  def testData do
    [
      [231_902_391, 26, 14, 0.123],
      [123_902_132, 27, 15, 0.345],
      [432_403_820, 24, 12, 0.567],
      [093_424_320, 27, 9, 0.890],
      [323_283_232, 23, 1, 0.113]
    ]
  end
end

defmodule MyList do
  def span(from, to, list \\ [])

  def span(from, to, list) when from == to do
    list
  end

  def span(from, to, []) do
    span(from, to, [to])
  end

  def span(from, to, list) when from < to do
    span(from, to - 1, [to - 1 | list])
  end
end
