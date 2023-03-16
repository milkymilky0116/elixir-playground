defmodule MyString do
  def is_printable([]) do
    true
  end

  def is_printable([char | tail]) when char >= 32 and char <= 126 do
    is_printable(tail)
  end

  def is_printable([_char | _tail]) do
    false
  end

  def is_anagram?(word1, word2)

  def is_anagram?(word1, word2), do: sum(word1) == sum(word2)

  defp sum(list, value \\ 0)

  defp sum([], value), do: value

  defp sum([head | tail], value) do
    sum(tail, value + head)
  end

  def calculate(str)

  def calculate(str) when is_list(str) do
    temp_str = List.to_string(str)
    symbol = Regex.scan(~r{[+-/\\*]}, temp_str) |> List.to_string()

    nums = Regex.split(~r{[+-/\\*]}, temp_str)

    [x, y] =
      for num <- nums do
        {int_val, ""} = Integer.parse(num)
        int_val
      end

    case symbol do
      "+" ->
        x + y

      "-" ->
        x - y

      "*" ->
        x * y

      "/" ->
        x / y
    end
  end
end

IO.puts(MyString.is_printable('Hello'))
IO.puts(MyString.is_printable('😀😃🚀'))
IO.puts(MyString.is_anagram?('EVERLAND', 'LAVENDER'))
IO.puts(MyString.is_anagram?('APPLE', 'APPE'))
IO.puts(MyString.calculate('12+24'))
IO.puts(MyString.calculate('24/12'))
IO.puts(MyString.calculate('10-5'))
IO.puts(MyString.calculate('10*10'))
