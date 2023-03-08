defmodule Factorial do
  def of(0), do: 1

  def of(n) when is_integer(n) and n > 0 do
    n * of(n - 1)
  end
end

defmodule Sum do
  def of(0), do: 0
  def of(n), do: of(n - 1) + n
end

defmodule Gcd do
  def of(x, 0), do: x
  def of(x, y), do: of(y, rem(x, y))
end

defmodule Guard do
  def what_is(x) when is_number(x) do
    IO.puts("#{x} is a number.")
  end

  def what_is(x) when is_list(x) do
    IO.puts("#{inspect(x)} is a list.")
  end

  def what_is(x) when is_atom(x) do
    IO.puts("#{x} is an atom")
  end
end

# Guard.what_is(99)
# Guard.what_is(:cat)
# Guard.what_is([1, 2, 3])

defmodule Example do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect([p1, p2, p3, p4])
  end
end

# Example.func("a", "b")

# Example.func("a", "b", "c")

# Example.func("a", "b", "c", "d")
