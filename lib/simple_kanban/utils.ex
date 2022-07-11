defmodule SimpleKanban.Utils do
  @spec format_error(Ecto.Changeset) :: list
  def format_error(changeset) do
    Enum.map(changeset.errors, fn {field, details} ->
      %{
        error: "Field '#{Atom.to_string(field)}' #{elem(details, 0)}",
        details: format_details(elem(details, 1))
      }
    end)
  end

  @spec format_details(list) :: String.t()
  def format_details(details) do
    case details[:validation] do
      :cast ->
        "Field needs to be of type '#{details[:type]}'"

      :required ->
        "Field is required"

      _ ->
        "No validation description found"
    end
  end
end
