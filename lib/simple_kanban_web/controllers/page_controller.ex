defmodule SimpleKanbanWeb.PageController do
  use SimpleKanbanWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
