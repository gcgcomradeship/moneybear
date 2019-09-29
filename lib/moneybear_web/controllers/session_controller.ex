defmodule MoneybearWeb.SessionController do
  use MoneybearWeb, :controller
  alias Moneybear.User

  plug(:put_layout, false)

  def new(conn, _params) do
    render(conn, "new.html", conn: conn)
  end

  def create(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    User
    |> where([a], a.email == ^email)
    |> Repo.one()
    |> Comeonin.Bcrypt.check_pass(pass)
    |> case do
      {:ok, admin} ->
        conn
        |> put_session(:current_user_id, admin.id)
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _} ->
        conn
        |> redirect(to: Routes.session_path(conn, :new))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_admin_id)
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
