defmodule Data do
    def print_min(file) do
        {:ok, content} = File.read(file)
        content 
        |> String.split("\n", trim: true)
        |> Enum.map(fn (line) -> String.split(line, " ", trim: true) end)
        |> Enum.map(&parse_temp_line/1)
        |> Enum.filter(&valid_temp_data?/1)
        |> Enum.reduce(&min_temp/2)
    end

    def parse_temp_line([index, max, min | _]) do
        {index, Float.parse(max), Float.parse(min)}
    end

    defp valid_temp_data?({_, :error, _}), do: false
    defp valid_temp_data?({_, _, :error}), do: false
    defp valid_temp_data?({_, {_max, _}, {_min, _}}), do: true

    defp min_temp(e = {_, {e_max, _}, {e_min, _}}, {_, {a_max, _}, {a_min, _}}) when (e_max - e_min) < (a_max - a_min), do: e
    defp min_temp(_e, a), do: a

end
