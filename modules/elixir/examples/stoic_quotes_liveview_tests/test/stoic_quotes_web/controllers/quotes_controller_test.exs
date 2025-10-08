defmodule StoicQuotesWeb.Tests.Controllers.QuotesControllerTest do
  use StoicQuotesWeb.ConnCase
  import StoicQuotes.QuotesFixtures

  describe "/api/quotes" do
    test "GET /api/quotes", %{conn: conn} do
      quote_fixture(%{quote: "1"})
      quote_fixture(%{quote: "2"})

      conn = get(conn, ~p"/api/quotes")

      assert [
               %{
                 "author" => "some author",
                 "quote" => "1",
                 "source" => "some source"
               },
               %{
                 "author" => "some author",
                 "quote" => "2",
                 "source" => "some source"
               }
             ] = json_response(conn, 200)["data"]
    end

    test "GET /api/quotes/random", %{conn: conn} do
      quote_fixture()
      conn = get(conn, ~p"/api/quotes/random")

      assert %{
               "author" => "some author",
               "quote" => "some quote",
               "source" => "some source"
             } = json_response(conn, 200)["data"]
    end
  end
end
