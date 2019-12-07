defmodule TrelloApi.Board do
  use Ecto.Schema
  import Ecto.Changeset

  alias TrelloApi.{Board, BoardList, Repo}

  @default_lists ["To do", "Doing", "Done"]

  schema "boards" do
    field :name, :string
    has_many :board_lists, BoardList

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def create(name) do
    %Board{}
    |> changeset(%{name: name})
    |> Repo.insert()
    |> after_insertion()
  end

  def list_boards() do
    Repo.all(Board)
  end

  def get_board!(id) do
    Repo.get!(Board, id)
  end

  def after_insertion({:ok, board}), do: create_default_lists(board)
  def after_insertion({:error, _changeset} = result), do: result

  def create_default_lists(board) do
    list = Enum.map()
  end
end