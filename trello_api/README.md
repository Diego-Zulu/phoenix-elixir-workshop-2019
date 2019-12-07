# TrelloApi

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Commands run at workshop

-`mix phx.new trello_api --no-webpack --no-html`. Create project
-`mix ecto.create`. Create db
-`mix phx.gen.schema Board boards name`. Create Board
-`mix ecto.migrate`. Apply migrations
-`iex -S mix`. Run elixir console
-`mix phx.server`. Run phoenix server
-`iex -S mix phx.server`. Run phoenix server with elixir console, this way i can run recompile
-`mix ecto.gen.migration create_board_lists_table`. Generate migration

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
