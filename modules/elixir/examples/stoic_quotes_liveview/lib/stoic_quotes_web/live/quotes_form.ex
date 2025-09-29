defmodule StoicQuotesWeb.Live.QuotesForm do
  use StoicQuotesWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(alert: nil)
     |> assign(form: to_form(%{"author" => nil, "source" => nil, "quote" => nil}))
    }
  end

  def handle_event("validate", params, socket) do
    IO.inspect(params, label: :validate)
    form = to_form(params)
    {:noreply,
      socket
      |> assign(form: form)
    }
  end

  def handle_event("save", params, socket) do
    IO.inspect(params, label: :save)
    form = to_form(params)
    {:noreply,
      socket
      |> assign(form: form)
    }
  end
end
