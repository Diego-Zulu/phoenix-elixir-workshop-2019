defmodule TrelloApi.Card do
  use Ecto.Schema
  import Ecto.Changeset

  alias TrelloApi.{ BoardList, Card, Repo }

  schema "cards" do
    field :text, :string
    belongs_to :board_list, BoardList

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:board_list_id, :text])
    |> validate_required([:board_list_id, :text])
    |> foreign_key_constraint(:board_list_id)
  end

  def create(board_list_id, text) do
    %Card{}
    |> changeset(%{board_list_id: board_list_id, text: text})
    |> Repo.insert()
  end

  def list_cards() do
    Repo.all(Card)
  end

  def get_card!(id) do
    Repo.get!(Card, id)
  end
end
