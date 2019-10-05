defmodule Moneybear.Plug.StateLoad do
  use MoneybearWeb, :plug

  alias MoneybearWeb.Service.State

  def call(%{assigns: %{current_user: current_user}} = conn, _opts),
    do: assign(conn, :state, State.get(current_user.id))
end
