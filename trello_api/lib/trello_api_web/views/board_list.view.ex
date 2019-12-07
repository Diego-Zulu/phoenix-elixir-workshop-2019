defmodule TrelloApiWeb.BoardListView do
  use TrelloApiWeb, :view

  def render("list_with_cards.json", %{board_list: board_list}) do
    %{
      id: board_list.id,
      title: board_list.title,
      cards: render_many(board_list.cards, TrelloApiWeb.CardView, "card.json")
    }
  end
end
