defmodule TrelloApi.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :text, :text, null: false
      add :board_list_id, references(:board_lists), null: false

      timestamps()
    end

  end
end
