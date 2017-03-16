defmodule BittrexExTest do
  use ExUnit.Case
  doctest BittrexEx

  test "get market summaries" do
    assert [%{"Last" => _} | _ ] = BittrexEx.get_market_summaries
  end
end
