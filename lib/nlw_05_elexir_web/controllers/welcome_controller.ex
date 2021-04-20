defmodule Nlw05ElexirWeb.WelcomeController do
  use Nlw05ElexirWeb, :controller

  alias Nlw05Elexir.Welcomer

  def index(conn, params) do
    params
    |> Welcomer.welcome
    |> handle_response(conn)
  end

  defp handle_response({:ok, message}, conn), do: render_response(conn, message, :ok)

  defp handle_response({:error, message}, conn), do: render_response(conn, message, :bad_request)

  defp render_response(conn, message, status) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end

end
