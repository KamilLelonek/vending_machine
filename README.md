# vending_machine

Recruitment algorithm for Toptal interview.

An elixir implementation of Vending Machine Problem.

Having the price and the amount given, calculate the change with the possible denominations of 1c, 5c, 10c, 25c, 50c, and $1.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `vending_machine` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:vending_machine, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/vending_machine>.

## Usage

```elixir
iex(1)> VendingMachine.get_change(5, 0.99)
[1, 0, 0, 0, 0, 4]
```

When $5 are paid for $0.99 product, 1c and 4 dollars are returned.
