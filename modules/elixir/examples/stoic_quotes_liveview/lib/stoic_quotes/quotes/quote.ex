defmodule StoicQuotes.Quotes.Quote do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__

  schema "quotes" do
    field(:quote, :string)
    field(:author, :string)
    field(:source, :string)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(quote, attrs) do
    quote
    |> cast(attrs, [:quote, :author, :source])
    |> validate_required([:quote, :author, :source])
    |> unique_constraint(:quote, name: :index_for_duplicate_quotes)
  end

  @doc false
  def new(attrs \\ %{"author" => "", "quote" => "", "source" => ""}) do
    changeset(%Quote{}, attrs)
  end
end
