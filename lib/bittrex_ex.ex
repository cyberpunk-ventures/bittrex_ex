defmodule BittrexEx do
  use HTTPoison.Base

  def get_market_summaries do
      with {:ok, response} <- get("https://bittrex.com/api/v1.1/public/getmarketsummaries")
      do
        body = Poison.Parser.parse!(response.body)
        body["result"]
      else {:error, reason} -> {:error, reason}
    end
  end

end
