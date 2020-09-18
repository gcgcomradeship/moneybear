defmodule MoneybearWeb.TestController do
  use MoneybearWeb, :controller

  def test(conn, params) do
    require Logger
    Logger.warn("------------------------------_")
    Logger.warn("------------------------------_")
    Logger.warn("------------------------------_")
    Logger.warn(inspect(params))
    Logger.warn("*******************************")
    Logger.warn("*******************************")
    Logger.warn("*******************************")
    Logger.warn(inspect(conn))
    Logger.warn("------------------------------_")
    Logger.warn("------------------------------_")
    Logger.warn("------------------------------_")
    render(conn, "test.json")
  end
end
