defmodule SimpleKanbanWeb.BoardController do
  use SimpleKanbanWeb, :controller
  alias SimpleKanban.{Repo, Board, Utils}
  import Ecto.Query

  def index(conn, _params) do
    case Repo.all(from b in Board, where: b.discarded == false) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{
          message: "No active boards found"
        })

      board ->
        res = Enum.map(board, fn x -> %{id: x.id, name: x.name} end)

        conn
        |> put_status(:ok)
        |> json(res)
    end
  end

  def show(conn, params) do
    case Repo.get(Board, params["id"]) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{
          message: "No board found"
        })

      board ->
        conn
        |> put_status(:ok)
        |> json(%{id: board.id, name: board.name, discarded: board.discarded})
    end
  end

  def create(conn, params) do
    %Board{}
    |> Board.changeset(%{name: params["name"]})
    |> Repo.insert()
    |> case do
      {:ok, board} ->
        conn
        |> put_status(:created)
        |> json(%{
          message: "Board created succesfully",
          id: board.id
        })

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(Utils.format_error(changeset))

      {:error} ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{
          message: "Error creating board"
        })
    end
  end
end
