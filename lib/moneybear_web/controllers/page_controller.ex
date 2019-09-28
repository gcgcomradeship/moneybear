defmodule MoneybearWeb.PageController do
  use MoneybearWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
