defmodule Bittrex do
  use HTTPoison.Base

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
