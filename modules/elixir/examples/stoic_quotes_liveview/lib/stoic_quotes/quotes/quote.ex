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
    |> unsafe_validate_unique(:quote, StoicQuotes.Repo)
    |> unique_constraint(:quote)
  end

  @doc false
  def new(attrs \\ %{"author" => "", "quote" => "", "source" => ""}) do
    case changeset(%Quote{}, attrs) do
      {_, changeset} -> changeset
      changeset -> changeset
    end
  end
end
