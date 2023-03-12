people = [
  %{name: "A", height: 1.24},
  %{name: "B", height: 1.45},
  %{name: "C", height: 1.123},
  %{name: "D", height: 1.53},
  %{name: "E", height: 1.119},
  %{name: "F", height: 1.144},
  %{name: "G", height: 1.543}
]

IO.inspect(for person = %{height: height} <- people, height > 1.5, do: person)
