defmodule TrelloApiWeb.BoardChannel do
  use TrelloApiWeb, :channel

  alias TrelloApi.BoardList

  def join("board:" <> _board_id, _parms, socket) do
    {:ok, socket}
  end

  def handle_in("card_created", %{"list_id" => list_id}, socket) do
    board_list = BoardList.get(list_id)

    broadcast!(socket, "user_created_card", %{
      list_id: list_id,
      cards: Phoenix.View.render_many(board_list.cards, TrelloApiWeb.CardView, "card.json")
    })

    {:noreply, socket}
  end
end
