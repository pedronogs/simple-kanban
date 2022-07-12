defmodule SimpleKanban.Repo.Migrations.AddBoardsTable do
  use Ecto.Migration

  def change do
    create table(:boards) do
      add :discarded, :boolean, default: false

      timestamps()
    end
  end
end
