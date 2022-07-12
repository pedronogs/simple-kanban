defmodule SimpleKanban.Repo.Migrations.AddFieldBoardsName do
  use Ecto.Migration

  def change do
    alter table(:boards) do
      add :name, :string
    end
  end
end
