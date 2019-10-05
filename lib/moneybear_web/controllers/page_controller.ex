defmodule MoneybearWeb.PageController do
  use MoneybearWeb, :controller
  import Phoenix.LiveView.Controller

  plug(Moneybear.Plug.StateLoad)

  def index(%{assigns: %{state: state}} = conn, _params) do
    log = "12312312312312312"
    live_render(conn, MoneybearWeb.PageLive, session: %{log: log, state: state})
  end
end
