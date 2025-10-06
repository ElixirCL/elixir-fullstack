defmodule StoicQuotes.Repo do
  use Ecto.Repo,
    otp_app: :stoic_quotes,
    adapter: Ecto.Adapters.SQLite3
end
