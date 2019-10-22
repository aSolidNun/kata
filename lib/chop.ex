defmodule Chop do
    
    def chop(_number, {}) do
        :not_found
    end

    def chop(number, {value}) when number != value do
        :not_found
    end

    def chop(number, list) do
        chop(number, list, 0, tuple_size(list))
    end

    defp chop(_number, _list, low, high) when high < low do
        :not_found
    end

    defp chop(number, list, low, high) do
        divider = div(high + low, 2)
        case elem(list, divider) do
            ^number -> {:ok, divider}
            divider_value when number < divider_value -> chop(number, list, low, divider - 1)
            divider_value when divider_value < number -> chop(number, list, divider + 1, high)
        end
    end

end