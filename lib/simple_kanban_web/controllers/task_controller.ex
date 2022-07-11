defmodule SimpleKanbanWeb.TaskController do
  use SimpleKanbanWeb, :controller
  alias SimpleKanban.{Repo, Task, Utils}

  def show(conn, params) do
    case Repo.get(Task, params["id"]) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{
          message: "Task not found"
        })

      task ->
        conn
        |> put_status(:ok)
        |> json(%{id: task.id, content: task.content})
    end
  end

  def create(conn, params) do
    %Task{}
    |> Task.changeset(%{content: params["content"]})
    |> Repo.insert()
    |> case do
      {:ok, _task} ->
        conn
        |> put_status(:created)
        |> json(%{
          message: "Task created succesfully"
        })

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(Utils.format_error(changeset))
    end
  end
end
