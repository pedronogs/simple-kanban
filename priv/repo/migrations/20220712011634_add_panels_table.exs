defmodule SimpleKanban.Repo.Migrations.AddPanelsTable do
  use Ecto.Migration
  @disable_ddl_transaction true

  def change do
    create table(:panels) do
      add :board_id, references(:boards)
      add :discarded, :boolean, default: false

      timestamps()
    end

    create index(:panels, [:board_id])
  end
end
