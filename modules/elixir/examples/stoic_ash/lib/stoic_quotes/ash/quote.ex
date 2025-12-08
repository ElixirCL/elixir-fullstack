defmodule StoicQuotes.Ash.Quote do
  require Ash.Expr

  use Ash.Resource,
    otp_app: :stoic_quotes,
    domain: StoicQuotes.Ash,
    extensions: [AshGraphql.Resource],
    data_layer: AshPostgres.DataLayer

  postgres do
    table "quotes"
    repo StoicQuotes.Repo
  end

  graphql do
    type :quote

    queries do
      list :random_quote, :random
      list :list_quotes, :read
    end

    mutations do
      create :create_quote, :create
      update :update_quote, :update
      destroy :destroy_quote, :destroy
    end
  end

  actions do
    defaults [:read, :destroy, create: :*, update: :*]

    read :random do
      prepare fn query, _context ->
        query
        |> Ash.Query.sort(Ash.Expr.calc(fragment("RANDOM()")))
        |> Ash.Query.limit(1)
      end
    end
  end

  attributes do
    integer_primary_key :id

    attribute :quote, :string do
      allow_nil? false
      public? true
    end

    attribute :author, :string do
      allow_nil? false
      public? true
    end

    attribute :source, :string do
      allow_nil? false
      public? true
    end
  end

  identities do
    identity :unique_quote, [:quote]
  end
end
