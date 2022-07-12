defmodule SimpleKanban.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :name, :string
    field :discarded, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:name, :discarded])
    |> validate_required([:name])
  end
end
