defmodule MoneybearWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use MoneybearWeb, :controller
      use MoneybearWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: MoneybearWeb

      import Plug.Conn
      import MoneybearWeb.Gettext
      import Phoenix.LiveView.Controller
      import Ecto.Query
      alias Moneybear.Repo
      alias MoneybearWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/moneybear_web/templates",
        namespace: MoneybearWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      import Phoenix.LiveView,
        only: [live_render: 2, live_render: 3, live_link: 1, live_link: 2]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import MoneybearWeb.ErrorHelpers
      import MoneybearWeb.Gettext
      alias MoneybearWeb.Router.Helpers, as: Routes
    end
  end

  def plug do
    quote do
      use Phoenix.Controller
      import Ecto.Query
      alias Moneybear.Repo
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import MoneybearWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
