defmodule MoneybearWeb.TestView do
  use MoneybearWeb, :view

  def render("test.json", _) do
    %{status: :ok}
  end
end
