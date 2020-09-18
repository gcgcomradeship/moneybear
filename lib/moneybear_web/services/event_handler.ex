defmodule MoneybearWeb.Service.EventHandler do
  use MoneybearWeb, :services

  def call(
        %{assigns: %{state: state, user_id: user_id}} = socket,
        "page_" <> page,
        _value
      ) do
    new_state = Map.put(state, "page", page)
    State.set(new_state, user_id)
    Phoenix.LiveView.assign(socket, :state, new_state)
  end

  def call(
        %{assigns: %{state: _state, user_id: user_id}} = socket,
        "env_" <> env,
        _value
      ) do
    Setting.env(user_id, env)

    new_assigns = %{
      env: env,
      state: State.get(user_id),
      settings: Setting.all(user_id)
    }

    Phoenix.LiveView.assign(socket, new_assigns)
  end

  def call(
        %{assigns: %{state: state, user_id: user_id}} = socket,
        "settings_menu_" <> page,
        _value
      ) do
    Setting.set(user_id, "menu", page)
    Phoenix.LiveView.assign(socket, %{settings: Setting.all(user_id)})
  end

  def call(
        %{assigns: %{user_id: user_id}} = socket,
        "settings_set_token",
        %{"token" => token}
      ) do
    Token.set(user_id, token)
    Phoenix.LiveView.assign(socket, %{settings: Setting.all(user_id)})
  end

  def call(
        %{assigns: %{user_id: user_id}} = socket,
        "settings_remove_token",
        _
      ) do
    Token.delete(user_id)
    Phoenix.LiveView.assign(socket, %{settings: Setting.all(user_id)})
  end

  def call(
        %{assigns: %{user_id: user_id}} = socket,
        "graph_draw",
        _
      ) do
    Phoenix.LiveView.assign(socket, %{settings: Setting.all(user_id)})
  end
end
