defmodule Moneybear.Plug.UserAuth do
  use MoneybearWeb, :plug

  alias Moneybear.User

  def call(conn, _opts) do
    case find_user(conn) do
      %User{} = user ->
        conn
        |> assign(:current_user, user)

      _ ->
        conn
        |> redirect(to: MoneybearWeb.Router.Helpers.session_path(conn, :new))
        |> halt()
    end
  end

  defp find_user(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: Moneybear.Repo.get(User, user_id)
  end
end
