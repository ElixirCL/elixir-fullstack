defmodule StoicQuotes.QuotesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StoicQuotes.Quotes` context.
  """

  @doc """
  Generate a quote.
  """
  def quote_fixture(attrs \\ %{}) do
    {:ok, quote} =
      attrs
      |> Enum.into(%{
        author: "some author",
        quote: "some quote",
        source: "some source"
      })
      |> StoicQuotes.Quotes.create_quote()

    quote
  end
end
