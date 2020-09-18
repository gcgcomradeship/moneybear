defmodule MoneybearWeb.PageController do
  use MoneybearWeb, :controller
  import Phoenix.LiveView.Controller

  plug(Moneybear.Plug.SettingsLoad)
  plug(Moneybear.Plug.StateLoad)

  def index(
        %{assigns: %{state: state, current_user: current_user, env: env, settings: settings}} =
          conn,
        _params
      ) do
    session = %{
      state: state,
      user_id: current_user.id,
      env: env,
      settings: settings
    }

    live_render(conn, MoneybearWeb.PageLive, session: session)
  end

  def test(conn, params) do
    render(conn, "test.json")
  end
end
