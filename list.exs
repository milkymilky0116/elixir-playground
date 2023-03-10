defmodule MyList do
  def mapsum(map_list, func, value \\ 0)

  def mapsum([], _func, value) do
    value
  end

  def mapsum([head | tail], func, value) do
    mapsum(tail, func, value + func.(head))
  end

  def my_max(list, value \\ 0)

  def my_max([], value) do
    value
  end

  def my_max([head | tail], value) when value > head do
    my_max(tail, value)
  end

  def my_max([head | tail], value) when value < head do
    my_max(tail, head)
  end

  def caesar("", _n) do
    []
  end

  def caesar(list, n) do
    [head | tail] = String.split(list, "", trim: true)
    <<v::utf8>> = head
    ascii = if v + n < ?z, do: v + n, else: ?a + rem(v + n, ?z) - 1
    letter = List.to_string([ascii])
    tail = Enum.join(tail, "")
    [letter | caesar(tail, n)]
  end
end

# IO.puts(MyList.mapsum([1, 2, 3], &(&1 + &1)))
IO.puts(MyList.my_max([10, 312, 12, 213, 1000, 112]))
IO.puts(MyList.caesar("orange", 13))
