defmodule StoicQuotes.Ash do
  use Ash.Domain, otp_app: :stoic_quotes, extensions: [AshGraphql.Domain]

  resources do
    resource StoicQuotes.Ash.Quote
  end
end
