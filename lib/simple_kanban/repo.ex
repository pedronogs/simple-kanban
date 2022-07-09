defmodule SimpleKanban.Repo do
  use Ecto.Repo,
    otp_app: :simple_kanban,
    adapter: Ecto.Adapters.Postgres
end
