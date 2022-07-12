defmodule SimpleKanban.Panel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "panels" do
    field :name, :string
    field :board_id, :id
    field :discarded, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(panel, attrs) do
    panel
    |> cast(attrs, [:name, :board_id, :discarded])
    |> validate_required([:name, :board_id])
  end
end
