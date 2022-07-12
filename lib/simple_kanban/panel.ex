defmodule SimpleKanban.Panel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "panels" do
    field :board_id, :id
    field :discarded, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(panel, attrs) do
    panel
  end
end
