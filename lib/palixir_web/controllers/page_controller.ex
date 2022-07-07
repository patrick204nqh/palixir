defmodule PalixirWeb.PageController do
  use PalixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
