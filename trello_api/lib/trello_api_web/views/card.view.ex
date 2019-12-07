defmodule TrelloApiWeb.CardView do
  use TrelloApiWeb, :view

  def render("cards.json", %{cards: cards}) do
    render_many(cards, __MODULE__, "card.json")
  end

  def render("card.json", %{card: card}) do
    %{
      id: card.id,
      board_list_id: card.board_list_id,
      text: card.text
    }
  end
end
