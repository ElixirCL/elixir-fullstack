[
  import_deps: [:ash_postgres, :ash_graphql, :absinthe, :ash, :ecto, :ecto_sql],
  subdirectories: ["priv/*/migrations"],
  plugins: [Absinthe.Formatter, Spark.Formatter],
  inputs: [
    "*.{heex,ex,exs}",
    "{config,lib,test,extensions,core}/**/*.{heex,ex,exs}",
    "priv/*/*.exs"
  ]
]
