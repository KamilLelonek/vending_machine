defmodule VendingMachine do
  # 1c, 5c, 10c, 25c, 50c, and $1
  @denominations [
    Decimal.new(1),
    Decimal.from_float(0.5),
    Decimal.from_float(0.25),
    Decimal.from_float(0.1),
    Decimal.from_float(0.05),
    Decimal.from_float(0.01)
  ]

  def get_change(money, price)
      when is_number(money) and
             is_number(price) and
             money > price do
    with {:ok, money, price} <- cast(money, price),
         {result, _} <- calculate_denominations(money, price) do
      result
      |> Enum.reverse()
      |> Enum.map(&Decimal.to_integer/1)
    end
  end

  defp calculate_denominations(money, price) do
    Enum.map_reduce(
      @denominations,
      Decimal.sub(money, price),
      &change/2
    )
  end

  defp change(denomination, accumulator) do
    {div, _rem} = Decimal.div_rem(accumulator, denomination)
    multiplication = Decimal.mult(denomination, div)
    rest = Decimal.sub(accumulator, multiplication)

    {div, rest}
  end

  defp cast(money, price) do
    with {:money, {:ok, money}} <- {:money, Decimal.cast(money)},
         {:price, {:ok, price}} <- {:price, Decimal.cast(price)} do
      {:ok, money, price}
    else
      {:money, :error} -> {:error, "Error casting money."}
      {:price, :error} -> {:error, "Error casting price."}
    end
  end
end
