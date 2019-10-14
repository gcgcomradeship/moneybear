defmodule Moneybear.Plug.SettingsLoad do
  use MoneybearWeb, :plug

  alias MoneybearWeb.Service.Setting

  def call(%{assigns: %{current_user: current_user}} = conn, _opts) do
    env = Setting.env(current_user.id)
    settings = Setting.all(current_user.id)

    conn
    |> assign(:env, env)
    |> assign(:settings, settings)
  end
end
