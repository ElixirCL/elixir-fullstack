defmodule StoicQuotes.Tests.Schemas.Quotes.QuoteSchemaTest do
  use ExUnit.Case
  alias StoicQuotes.Quotes.Quote

  describe "quote schema field and types tests" do
    test "that schema has the correct fields and types" do
      expected_fields_and_types = [
        {:id, :id},
        {:quote, :string},
        {:author, :string},
        {:source, :string},
        {:inserted_at, :utc_datetime},
        {:updated_at, :utc_datetime}
      ]

      actual_fields_and_types =
        for field <- Quote.fields() do
          type = Quote.__schema__(:type, field)
          {field, type}
        end

      assert MapSet.new(expected_fields_and_types) == MapSet.new(actual_fields_and_types)
    end
  end
end
