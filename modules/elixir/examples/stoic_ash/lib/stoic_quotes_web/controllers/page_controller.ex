defmodule StoicQuotesWeb.PageController do
  use StoicQuotesWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
