defmodule MoneybearWeb.PageController do
  use MoneybearWeb, :controller
  import Phoenix.LiveView.Controller

  def index(conn, _params) do
    log = "12312312312312312"
    live_render(conn, MoneybearWeb.PageLive, session: %{log: log})
  end
end
