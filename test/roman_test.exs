defmodule RomanTest do
  use ExUnit.Case

  test "boundry 0" do
    assert Roman.convert(0) == ""
  end

  test "basic literal 1" do
    assert Roman.convert(1) == "I"
  end

  test "basic addition 7" do
    assert Roman.convert(7) == "VII"
  end

  test "large number 1978" do
    assert Roman.convert(1978) == "MCMLXXVIII"
  end

  test "nein nein nein 999" do
    assert Roman.convert(999) == "CMXCIX"
  end
end
