defmodule BittrexEx do
  use HTTPoison.Base

  def get_market_summaries do
    get("https://bittrex.com/api/v1.1/public/getmarketsummaries")
    |> Poison.Parser.parse!
  end
end
