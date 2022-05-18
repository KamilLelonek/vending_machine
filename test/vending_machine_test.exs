defmodule VendingMachineTest do
  use ExUnit.Case, async: true

  describe "get_change/2" do
    test "should return proper change" do
      assert [1, 0, 0, 0, 0, 4] = VendingMachine.get_change(5, 0.99)
      assert [0, 1, 1, 0, 0, 1] = VendingMachine.get_change(3.14, 1.99)
      assert [4, 0, 2, 1, 1, 2] = VendingMachine.get_change(3, 0.01)
      assert [1, 0, 1, 1, 1, 0] = VendingMachine.get_change(4, 3.14)
      assert [1, 0, 1, 0, 0, 0] = VendingMachine.get_change(0.45, 0.34)
    end
  end
end
