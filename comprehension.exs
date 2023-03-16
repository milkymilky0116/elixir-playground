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

defmodule Prime do
  def range(n) do
    init_list = MyList.span(2, n)
    for x <- init_list, is_prime(x) == true, do: x
  end

  def is_prime(n, i \\ 2)

  def is_prime(n, i) when i * i > n do
    true
  end

  def is_prime(n, i) do
    if rem(n, i) == 0 do
      false
    else
      is_prime(n, i + 1)
    end
  end
end
