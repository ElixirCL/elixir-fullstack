defmodule StoicCli do
  @quotes [
    %{
      quote:
        "Seldom are any found unhappy from not observing what is in the minds of others. But such as observe not well the stirrings of their own souls must of necessity be unhappy.",
      author: "Marcus Aurelius",
      source: "Book II, Meditations"
    },
    %{
      quote:
        "Consider whence each thing came, of what it was compounded, into what it will be changed, how it will be with it when changed, and that it will suffer no evil.",
      author: "Marcus Aurelius",
      source: "Book XI, Meditations"
    },
    %{
      quote:
        "Accustom yourself as much as possible, when any one takes any action, to consider only: To what end is he working? But begin at home; and examine yourself first of all.",
      author: "Marcus Aurelius",
      source: "Book X, Meditations"
    }
  ]

  def main(args) do
    args
    |> parse()
    |> run()
  end

  defp parse(args) do
    OptionParser.parse(
      args,
      switches: [list: :boolean],
      aliases: [l: :list]
    )
  end

  defp run({[list: true], _, _}) do
    list()
  end

  defp run(_) do
    IO.puts("""
    Usage: stoic_cli --list
    """)
  end

  defp list() do
    @quotes
    |> Enum.map(fn quote ->
      "#{quote.quote} --- #{quote.author} (#{quote.source})"
    end)
    |> Enum.join("\n")
    |> IO.inspect()
  end
end
