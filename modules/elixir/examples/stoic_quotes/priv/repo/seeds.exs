alias StoicQuotes.Quotes

# Read quotes from the JSON file
quotes_path = "priv/repo/quotes.json"

quotes_path
|> File.read!()
|> Jason.decode!()
|> Enum.each(fn attrs ->
  quote = %{quote: attrs["quote"], author: attrs["author"], source: attrs["source"]}

  case Quotes.create_quote(quote) do
    {:ok, _quote} -> :ok
    {:error, _changeset} -> :duplicate
  end
end)
