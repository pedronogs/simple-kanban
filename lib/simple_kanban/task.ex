defmodule SimpleKanban.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :content, :string
    field :done, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(task, attrs \\ %{}) do
    task
    |> cast(attrs, [:content, :done])
    |> validate_required([:content, :done])
    |> validate_length(:content, min: 3)
    |> validate_length(:content, max: 1000)
  end
end
