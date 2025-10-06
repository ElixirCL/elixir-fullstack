defmodule StoicQuotesWeb.QuotesController do
  use Phoenix.Controller, formats: [:json]
  alias StoicQuotes.Quotes

  def index(conn, _params) do
    quotes = %{quotes: Quotes.list_quotes()}
    render(conn, :index, quotes)
  end

  def show(conn, _params) do
    quote = %{quote: Quotes.get_random_quote()}
    render(conn, :show, quote)
  end
end
