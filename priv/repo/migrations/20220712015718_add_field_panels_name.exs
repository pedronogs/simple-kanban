defmodule SimpleKanban.Repo.Migrations.AddFieldPanelsName do
  use Ecto.Migration

  def change do
    alter table(:panels) do
      add :name, :string
    end
  end
end
