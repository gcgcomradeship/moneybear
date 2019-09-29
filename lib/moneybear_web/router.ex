defmodule MoneybearWeb.Router do
  use MoneybearWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug(Moneybear.Plug.UserAuth)
  end

  scope "/", MoneybearWeb do
    pipe_through :browser
    get("/sign_in", SessionController, :new)
    post("/sign_in", SessionController, :create)
    get("/sign_out", SessionController, :delete)
    pipe_through :auth
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", MoneybearWeb do
  #   pipe_through :api
  # end
end
