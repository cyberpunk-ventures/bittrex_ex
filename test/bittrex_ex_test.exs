defmodule BittrexTest do
  use ExUnit.Case
  doctest Bittrex

  test "get market summaries" do
    assert {:ok, [%{"Last" => _} | _ ]} = Bittrex.get_market_summaries
  end

  test "get last ticker value for btc and eth" do
    {:ok, market_summaries} = Bittrex.get_market_summaries
    last_price = Bittrex.get_last(market_summaries, "btc", "eth")
    assert is_float(last_price)
  end
end
