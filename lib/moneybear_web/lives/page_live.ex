defmodule MoneybearWeb.PageLive do
  use Phoenix.LiveView
  alias MoneybearWeb.Service.State
  alias MoneybearWeb.Service.Setting
  alias MoneybearWeb.Service.Token

  alias MoneybearWeb.Service.EventHandler

  def render(assigns) do
    ~L"""
      <%= Phoenix.View.render(MoneybearWeb.PageView, "index.html", assigns) %>
    """
  end

  def mount(%{state: state, user_id: user_id, env: env, settings: settings} = session, socket) do
    if connected?(socket), do: :timer.send_interval(30000, self(), :update)
    {:ok, assign(socket, %{state: state, user_id: user_id, env: env, settings: settings})}
  end

  def handle_info(:update, socket) do
    {:noreply, assign(socket, :log, "Reconnect")}
  end

  def handle_event(data, value, socket) do
    sock = EventHandler.call(socket, data, value)
    {:noreply, sock}
  end
end
