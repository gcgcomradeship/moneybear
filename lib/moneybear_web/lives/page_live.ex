defmodule MoneybearWeb.PageLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      <%= Phoenix.View.render(MoneybearWeb.PageView, "index.html", assigns) %>
    """
  end

  def mount(%{log: log} = session, socket) do
    if connected?(socket), do: :timer.send_interval(30000, self(), :update)
    {:ok, assign(socket, :log, log)}
  end

  def handle_info(:update, socket) do
    {:noreply, assign(socket, :log, "Asdasdasdas")}
  end

  def handle_event("change", _value, socket) do
    {:noreply, assign(socket, :log, "000000000")}
  end
end

# defmodule OpmWeb.Admin.DashboardLive do
#   use Phoenix.LiveView
#   alias OpmWeb.Service.Dashboard.Query
#   alias OpmWeb.Service.Dashboard.State

#   def render(assigns) do
#     ~L"""
#     <%= Phoenix.View.render(OpmWeb.Admin.DashboardView, "index.html", assigns) %>
#     """
#   end

#   def mount(%{admin_id: admin_id} = session, socket) do
#     data =
#       admin_id
#       |> State.get()
#       |> Query.call()

#     labels = Enum.map(data, fn [l, _p] -> l end)
#     points = Enum.map(data, fn [_l, p] -> p end)
#     providers = Query.providers()
#     origins = Query.origins()

#     {:ok,
#      assign(socket,
#        admin_id: admin_id,
#        state: State.get(admin_id),
#        labels: Jason.encode!(labels),
#        points: Jason.encode!(points),
#        providers: providers,
#        origins: origins
#      )}
#   end

#   def handle_event(
#         "form_change_" <> type_value,
#         event_data,
#         %{assigns: %{state: state, admin_id: admin_id}} = socket
#       ) do
#     new_state = State.exec(state, type_value, event_data)
#     State.set(admin_id, new_state)
#     data = Query.call(new_state)
#     labels = Enum.map(data, fn [l, _p] -> l end)
#     points = Enum.map(data, fn [_l, p] -> p end)

#     {:noreply,
#      assign(socket,
#        state: new_state,
#        labels: Jason.encode!(labels),
#        points: Jason.encode!(points)
#      )}
#   end
# end
