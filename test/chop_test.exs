defmodule ChopTest do
    use ExUnit.Case

    test "Empty list" do
        assert Chop.chop(3, {}) == :not_found
    end

    test "Not found in list of 1" do
        assert Chop.chop(3, {1}) == :not_found
    end

    test "Found in list of 1" do
        assert Chop.chop(1, {1}) == {:ok, 0}
    end

    test "Not found in longer list" do
        assert Chop.chop(4, {1, 2, 3, 5}) == :not_found
    end

    test "Found in longer list" do
        assert Chop.chop(4, {1, 2, 4, 5}) == {:ok, 2}
    end

    test "Found first" do
        assert Chop.chop(2, {2, 3, 4, 5, 6}) == {:ok, 0}
    end

    test "Found last" do
        assert Chop.chop(5, {0, 1, 2, 3, 5}) == {:ok, 4}
    end
end