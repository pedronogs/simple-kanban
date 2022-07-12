defmodule SimpleKanbanWeb.PanelController do
  use SimpleKanbanWeb, :controller
  alias SimpleKanban.{Repo, Panel, Utils}
  import Ecto.Query

  # Query all panels by 'board_id
  def index(conn, params) do
    case Repo.all(
           from p in Panel,
             where: p.board_id == ^params["board_id"] and p.discarded == false
         ) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{
          message: "No active panels found for this board"
        })

      panel ->
        res =
          Enum.map(panel, fn x ->
            %{panel_id: x.id, name: x.name, board_id: x.board_id, discarded: x.discarded}
          end)

        conn
        |> put_status(:ok)
        |> json(res)
    end
  end

  def show(conn, params) do
    case Repo.get(Panel, params["id"]) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{
          message: "Panel not found"
        })

      panel ->
        conn
        |> put_status(:ok)
        |> json(%{
          id: panel.id,
          name: panel.name,
          board_id: panel.board_id,
          discarded: panel.discarded
        })
    end
  end

  def create(conn, params) do
    %Panel{}
    |> Panel.changeset(%{name: params["name"], board_id: params["board_id"]})
    |> Repo.insert()
    |> case do
      {:ok, panel} ->
        conn
        |> put_status(:created)
        |> json(%{
          message: "Panel created succesfully",
          id: panel.id
        })

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(Utils.format_error(changeset))

      {:error} ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{
          message: "Error creating panel"
        })
    end
  end
end
