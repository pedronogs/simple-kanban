defmodule SimpleKanbanWeb.TaskController do
  use SimpleKanbanWeb, :controller
  alias SimpleKanban.{Repo, Task, Utils}
  import Ecto.Query

  # Query all tasks by 'panel_id'
  def index(conn, params) do
    case Repo.all(from t in Task, where: t.panel_id == ^params["panel_id"]) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{
          message: "No tasks found for this panel"
        })

      tasks ->
        res =
          Enum.map(tasks, fn x ->
            %{task_id: x.id, content: x.content, panel_id: x.panel_id, done: x.done}
          end)

        conn
        |> put_status(:ok)
        |> json(res)
    end
  end

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
        |> json(%{id: task.id, panel_id: task.panel_id, content: task.content})
    end
  end

  def create(conn, params) do
    %Task{}
    |> Task.changeset(%{panel_id: params["panel_id"], content: params["content"]})
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

      {:error} ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{
          message: "Error creating task"
        })
    end
  end
end
