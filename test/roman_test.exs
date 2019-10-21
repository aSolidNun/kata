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
end
