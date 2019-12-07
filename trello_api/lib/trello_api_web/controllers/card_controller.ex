defmodule TrelloApiWeb.CardController do
  use TrelloApiWeb, :controller

  alias TrelloApi.Card

  def create(conn, %{"board_list_id" => board_list_id, "text" => text}) do
    case Card.create(board_list_id, text) do
      {:ok, card} ->
        conn
        |> put_status(:created)
        |> render("card.json", card: card)

      {:error, _changeset} ->
        conn
        |> put_status(:bad_request)
        |> json(%{errors: ["Invalid Card"]})
    end
  end

  def index(conn, _params) do
    cards = Card.list_cards()
    render(conn, "cards.json", cards: cards)
  end

  def show(conn, %{"id" => id}) do
    card = Card.get_card!(id)
    render(conn, "card.json", card: card)
  end
end
