defmodule StoicQuotes.Tests.Schemas.Quotes.QuoteSchemaTest do
  use StoicQuotes.DataCase

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
        for field <- Quote.__schema__(:fields) do
          type = Quote.__schema__(:type, field)
          {field, type}
        end

      assert MapSet.new(expected_fields_and_types) == MapSet.new(actual_fields_and_types)
    end
  end

  describe "changeset/2" do
    test "that changeset with valid params is valid" do
      params = %{
        "author" => "Marcus Aurelius",
        "source" => "Meditations",
        "quote" =>
          "You have power over your mind — not outside events. Realize this, and you will find strength."
      }

      changeset = Quote.changeset(%Quote{}, params)

      assert %Ecto.Changeset{valid?: true, changes: _} = changeset
    end

    test "that changeset with invalid params is invalid" do
      params = %{
        "author" => "",
        "source" => "Meditations",
        "quote" =>
          "You have power over your mind — not outside events. Realize this, and you will find strength."
      }

      changeset = Quote.changeset(%Quote{}, params)

      assert %Ecto.Changeset{
               valid?: false,
               errors: [{:author, {"can't be blank", [validation: :required]}}]
             } =
               changeset

      params = %{
        "author" => "Marcus Aurelius",
        "source" => "",
        "quote" =>
          "You have power over your mind — not outside events. Realize this, and you will find strength."
      }

      changeset = Quote.changeset(%Quote{}, params)

      assert %Ecto.Changeset{
               valid?: false,
               errors: [{:source, {"can't be blank", [validation: :required]}}]
             } =
               changeset

      params = %{
        "author" => "Marcus Aurelius",
        "source" => "Meditations",
        "quote" => ""
      }

      changeset = Quote.changeset(%Quote{}, params)

      assert %Ecto.Changeset{
               valid?: false,
               errors: [{:quote, {"can't be blank", [validation: :required]}}]
             } =
               changeset
    end
  end

  describe "new/1" do
    test "that returns a changeset" do
      params = %{
        "author" => "Marcus Aurelius",
        "source" => "Meditations",
        "quote" =>
          "You have power over your mind — not outside events. Realize this, and you will find strength."
      }

      changeset = Quote.new(params)

      assert %Ecto.Changeset{valid?: true, changes: _} = changeset
    end
  end
end
