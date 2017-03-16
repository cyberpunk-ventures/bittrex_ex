defmodule BittrexExTest do
  use ExUnit.Case
  doctest BittrexEx

  test "get market summaries" do
    assert {:ok, [%{"Last" => _} | _ ]} = BittrexEx.get_market_summaries
  end

  test "get last ticker value for btc and eth" do
    {:ok, market_summaries} = BittrexEx.get_market_summaries
    last_price = BittrexEx.get_last(market_summaries, "btc", "eth")
    assert is_float(last_price)
  end
end
