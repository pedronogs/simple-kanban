defmodule SimpleKanban.Repo.Migrations.AddTasksTable do
  use Ecto.Migration
  @disable_ddl_transaction true

  def change do
    create table(:tasks) do
      add :panel_id, references(:panels)
      add :content, :text
      add :done, :boolean, default: false

      timestamps()
    end

    create index(:tasks, [:panel_id])
  end
end
