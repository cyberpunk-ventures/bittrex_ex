defmodule BittrexExTest do
  use ExUnit.Case
  doctest BittrexEx

  test "get market summaries" do
    assert [%{"last" => 0} | _ ] = BittrexEx.get_market_summaries
  end
end
