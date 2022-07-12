defmodule SimpleKanban.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :discarded, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
  end
end
