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

  def filter([], _, result), do: result

  def filter([head | tail], func, result) do
    is_ok = func.(head)

    if is_ok do
      # easy way
      filter(tail, func, result ++ [head])
    else
      filter(tail, func, result)
    end
  end

  # todo: split(list,num)
  # todo: take(list,num)
end
