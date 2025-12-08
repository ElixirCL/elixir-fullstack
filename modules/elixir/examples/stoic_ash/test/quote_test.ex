defmodule StoicQuotes.Ash.QuoteTest do
  use StoicQuotes.DataCase, async: true

  alias StoicQuotes.Ash.Quote

  describe "quote lifecycle" do
    test "creates a quote successfully" do
      quote =
        Quote.create!(%{
          quote: "Waste no more time arguing what a good man should be. Be one.",
          author: "Marcus Aurelius",
          source: "Meditations"
        })

      assert quote.quote == "Waste no more time arguing what a good man should be. Be one."
      assert quote.author == "Marcus Aurelius"
      assert quote.source == "Meditations"
      assert quote.id
    end

    test "validates required fields" do
      assert_raise Ash.Error.Invalid, fn ->
        Quote.create!(%{})
      end
    end

    test "enforces unique quote constraint" do
      Quote.create!(%{
        quote: "The happiness of your life depends upon the quality of your thoughts.",
        author: "Marcus Aurelius",
        source: "Meditations"
      })

      assert_raise Ash.Error.Invalid, fn ->
        Quote.create!(%{
          quote: "The happiness of your life depends upon the quality of your thoughts.",
          author: "Different Author",
          source: "Different Source"
        })
      end
    end
  end

  describe "quote updates" do
    setup do
      quote =
        Quote.create!(%{
          quote: "You have power over your mind - not outside events.",
          author: "Marcus Aurelius",
          source: "Meditations"
        })

      {:ok, quote: quote}
    end

    test "updates a quote", %{quote: quote} do
      updated_quote = Quote.update!(quote, %{source: "Meditations, Book VIII"})
      assert updated_quote.source == "Meditations, Book VIII"
    end

    test "preserves original fields when updating partial data", %{quote: quote} do
      updated_quote = Quote.update!(quote, %{author: "M. Aurelius"})
      assert updated_quote.author == "M. Aurelius"
      assert updated_quote.quote == quote.quote
      assert updated_quote.source == quote.source
    end
  end

  describe "random quote action" do
    setup do
      quotes = [
        %{
          quote: "The first rule is to keep an untroubled spirit.",
          author: "Marcus Aurelius",
          source: "Meditations"
        },
        %{
          quote:
            "It is not death that a man should fear, but he should fear never beginning to live.",
          author: "Marcus Aurelius",
          source: "Meditations"
        },
        %{
          quote: "The best revenge is not to be like your enemy.",
          author: "Marcus Aurelius",
          source: "Meditations"
        }
      ]

      inserted_quotes =
        quotes
        |> Enum.map(fn attrs ->
          Quote.create!(attrs)
        end)

      {:ok, quotes: inserted_quotes}
    end

    test "returns a random quote", %{quotes: quotes} do
      results =
        for _ <- 1..10 do
          Quote
          |> Ash.Query.for_read(:random)
          |> Ash.read_one()
        end
        |> Enum.reject(&is_nil/1)

      assert length(results) > 0
      assert Enum.all?(results, fn quote -> quote.id end)
    end

    test "limits to one quote", %{quotes: quotes} do
      random_quote =
        Quote
        |> Ash.Query.for_read(:random)
        |> Ash.read_one()

      assert random_quote
      assert random_quote.id
      assert is_map(random_quote)
    end
  end

  describe "quote deletion" do
    setup do
      quote =
        Quote.create!(%{
          quote:
            "How much time he gains who does not look to see what his neighbour says or does or thinks.",
          author: "Marcus Aurelius",
          source: "Meditations"
        })

      {:ok, quote: quote}
    end

    test "deletes a quote", %{quote: quote} do
      assert {:ok, _} = Quote.destroy(quote)
      refute Ash.get(Quote, quote.id)
    end
  end

  describe "list quotes" do
    setup do
      quotes = [
        %{
          quote: "Very little is needed to make a happy life.",
          author: "Marcus Aurelius",
          source: "Meditations"
        },
        %{
          quote: "Accept whatever comes to you woven in the pattern of your destiny.",
          author: "Marcus Aurelius",
          source: "Meditations"
        }
      ]

      inserted_quotes =
        quotes
        |> Enum.map(fn attrs ->
          Quote.create!(attrs)
        end)

      {:ok, quotes: inserted_quotes}
    end

    test "lists all quotes", %{quotes: quotes} do
      all_quotes = Ash.read!(Quote)
      assert length(all_quotes) >= length(quotes)
      assert Enum.all?(quotes, fn quote -> quote.id in Enum.map(all_quotes, & &1.id) end)
    end
  end
end
