defmodule StoicQuotesWeb.Tests.Live.QuotesFormTest do
  use StoicQuotesWeb.ConnCase
  import Phoenix.LiveViewTest

  describe "LiveView quotes form page tests" do
    test "that valid form saving is done", %{conn: conn} do
      {:ok, lv, _html} =
        live(
          conn,
          ~p"/"
        )

      lv
      |> form("form", %{
        "author" => "some author",
        "source" => "some source",
        "quote" => "some quote"
      })
      |> render_submit()

      conn = get(conn, ~p"/api/quotes")

      assert [
               %{
                 "author" => "some author",
                 "quote" => "some quote",
                 "source" => "some source"
               }
             ] = json_response(conn, 200)["data"]
    end

    test "that invalid form shows errors", %{conn: conn} do
      {:ok, lv, _html} =
        live(
          conn,
          ~p"/"
        )

      result =
        lv
        |> form("form", %{
          "author" => "",
          "source" => "",
          "quote" => ""
        })
        |> render_submit()

      assert result =~ "can&#39;t be blank"
    end

    test "that valid form cannot save duplicates", %{conn: conn} do
      {:ok, lv, _html} =
        live(
          conn,
          ~p"/"
        )

      lv
      |> form("form", %{
        "author" => "some author",
        "source" => "some source",
        "quote" => "some quote"
      })
      |> render_submit()

      result =
        lv
        |> form("form", %{
          "author" => "some author",
          "source" => "some source",
          "quote" => "some quote"
        })
        |> render_submit()

      assert result =~ "There was an error saving the Quote"
    end
  end
end
