defmodule Football do

    def print_best() do
        File.read!("./data/football.dat")
        |> String.split("\n")
        |> Enum.map(fn (line) -> String.split(line, " ", trim: true) end)
        |> Enum.map(&parse_line/1)
        |> Enum.filter(&valid_football_data/1)
        |> Enum.reduce(&best_football_team/2)
        |> format()
        |> IO.puts()
        
    end

    defp parse_line(line) do
    end
end