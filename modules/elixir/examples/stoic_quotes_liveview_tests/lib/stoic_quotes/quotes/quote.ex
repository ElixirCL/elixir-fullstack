defmodule StoicQuotes.Quotes.Quote do
  use Ecto.Schema
  import Ecto.Changeset

  @optional_fields [:id, :inserted_at, :updated_at]

  schema "quotes" do
    field(:quote, :string)
    field(:author, :string)
    field(:source, :string)

    timestamps(type: :utc_datetime)
  end

  def fields() do
    __MODULE__.__schema__(:fields)
  end

  def required_fields() do
    fields() -- @optional_fields
  end

  @doc false
  def changeset(quote, attrs) do
    quote
    |> cast(attrs, fields())
    |> validate_required(required_fields())
    |> unsafe_validate_unique(:quote, StoicQuotes.Repo)
    |> unique_constraint(:quote)
  end

  @doc false
  def new(attrs \\ %{"author" => "", "quote" => "", "source" => ""}) do
    case changeset(%__MODULE__{}, attrs) do
      {_, changeset} -> changeset
      changeset -> changeset
    end
  end
end
