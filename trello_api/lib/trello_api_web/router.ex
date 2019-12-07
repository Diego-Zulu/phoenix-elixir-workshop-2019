defmodule TrelloApiWeb.Router do
  use TrelloApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TrelloApiWeb do
    pipe_through :api

    resources "/boards", BoardController, only: [:create, :index, :show]

    post "/lists/:board_list_id/cards", CardController, :create
  end
end
