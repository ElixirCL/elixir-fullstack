defmodule StoicQuotesWeb.Live.QuotesForm do
  use StoicQuotesWeb, :live_view

  alias StoicQuotes.Quotes.Quote
  alias StoicQuotes.Quotes

  require Logger

  defp empty_form() do
    to_form(%{"author" => "", "quote" => "", "source" => ""})
  end

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(alert: nil)
     |> assign(form: empty_form())}
  end

  def handle_event("validate", params, socket) do
    changeset =
      Quote.new(params)

    form = to_form(params, errors: changeset.errors)

    Logger.debug(changeset)
    Logger.debug(form)

    {:noreply,
     socket
     |> assign(form: form)}
  end

  def handle_event("save", params, socket) do
    changeset =
      Quote.new(params)

    form = to_form(params, errors: changeset.errors)

    Logger.debug(changeset)
    Logger.debug(form)

    socket =
      case changeset.valid? do
        true ->
          case Quotes.create_quote(params) do
            {:ok, result} ->
              Logger.debug(result)

              socket
              |> assign(form: empty_form())
              |> put_flash(:info, "Created new Quote")

            error ->
              socket
              |> assign(form: form)
              |> put_flash(:error, "There was an error saving the Quote")
          end

        false ->
          socket
          |> assign(form: form)
          |> put_flash(:error, "There was an error saving the Quote")
      end

    {:noreply, socket}
  end
end
