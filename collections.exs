defmodule MyList do
  def all(list, func, result \\ true)

  def all(_, _, result) when result == false do
    false
  end

  def all([], _, _), do: true

  def all([head | tail], fun, _) do
    result = fun.(head)
    all(tail, fun, result)
  end

  def each([], _), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter(list, func, result \\ [])

  def filter([], _, result) do
    reverse(result)
  end

  def filter([head | tail], func, result) do
    is_ok = func.(head)

    if is_ok do
      # easy way
      # filter(tail, func, result ++ [head])

      # hard way
      filter(tail, func, [head | result])
    else
      filter(tail, func, result)
    end
  end

  def reverse(list, result \\ [])

  def reverse([], result), do: result

  def reverse([head | tail], result) do
    reverse(tail, [head | result])
  end

  def split(list, num, split_list \\ [], remain \\ [])

  def split(_list, 0, split_list, remain) do
    {reverse(split_list), remain}
  end

  def split([head | tail], num, split_list, _remain) do
    split(tail, num - 1, [head | split_list], tail)
  end

  def take(list, num, result \\ [])

  def take(_list, 0, result), do: reverse(result)

  def take([head | tail], num, result) do
    take(tail, num - 1, [head | result])
  end

  def flatten(list, result \\ [])

  def flatten([], result) do
    reverse(result)
  end

  def flatten([head | tail], result) when is_list(head) do
    if length(tail) > 0 do
      flatten(head, result) ++ flatten(tail, [])
    else
      flatten(head, result)
    end
  end

  def flatten([head | tail], result) when not is_list(head) do
    flatten(tail, [head | result])
  end
end

list = [1, 2, 3, 4, 5]

IO.inspect(list)
IO.puts("Is all of elements of list are less than 6? : #{MyList.all(list, &(&1 < 6))}")
IO.puts("Is all of elements of list are bigger than 3? : #{MyList.all(list, &(&1 > 3))}")

MyList.each(list, &IO.puts("My own each function : #{&1}"))

newFilteredList = MyList.filter(list, &(&1 > 3))
IO.inspect(newFilteredList)

newReverseList = MyList.reverse(list)
IO.inspect(newReverseList)

newSplitList = MyList.split(list, 3)
IO.inspect(newSplitList)

newTakeList = MyList.take(list, 3)
IO.inspect(newTakeList)

newFlattenList = MyList.flatten([1, [[2]], [3, 4], 5, [[[[[6]]]]]])

IO.inspect(newFlattenList)
