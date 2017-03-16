defmodule BittrexExTest do
  use ExUnit.Case
  doctest BittrexEx

  test "get market summaries" do
    assert [%{"Last" => _} | _ ] = BittrexEx.get_market_summaries
  end

  test "get last ticker value for btc and eth" do
    assert is_float(BittrexEx.get_market_summaries |> BittrexEx.get_last("btc", "eth"))
  end
end
