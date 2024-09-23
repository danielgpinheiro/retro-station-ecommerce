defmodule RetroStationWeb.RedirectController do
  use RetroStationWeb, :controller

  def index(conn, _params) do
    conn
    |> redirect(to: "/home")
    |> halt()
  end
end
