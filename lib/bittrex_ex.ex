defmodule Bittrex do
  use HTTPoison.Base

  @doc """
  Returns a list of "market summaries" for last 24 hours

  Example "market summary":
  ```
  {
			"MarketName" : "BTC-888",
			"High" : 0.00000919,
			"Low" : 0.00000820,
			"Volume" : 74339.61396015,
			"Last" : 0.00000820,
			"BaseVolume" : 0.64966963,
			"TimeStamp" : "2014-07-09T07:19:30.15",
			"Bid" : 0.00000820,
			"Ask" : 0.00000831,
			"OpenBuyOrders" : 15,
			"OpenSellOrders" : 15,
			"PrevDay" : 0.00000821,
			"Created" : "2014-03-20T06:00:00",
			"DisplayMarketName" : null
		}
  ```
  """
  def get_market_summaries do
      with {:ok, response} <- get("https://bittrex.com/api/v1.1/public/getmarketsummaries")
      do
        body = Poison.Parser.parse!(response.body)
        {:ok, body["result"]}
      else {:error, reason} -> {:error, reason}
    end
  end

  def get_last(market_summaries, first, last) do
     market_summaries
     |> Enum.find(fn el -> el["MarketName"] === format_pair(first, last) end )
     |> Map.get("Last")
  end

  def format_pair(first, last) do
    import String, only: [upcase: 1]
    upcase(first) <> "-" <> upcase(last)
  end
end
