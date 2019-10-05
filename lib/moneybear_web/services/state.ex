defmodule MoneybearWeb.Service.State do
  use MoneybearWeb, :services

  def get(user_id) do
    case Redis.get("state/#{user_id}") do
      nil -> init(user_id)
      json_state -> Jason.decode!(json_state)
    end
  end

  defp init(user_id) do
    new_state = %{
      page: "main"
    }

    Redis.set("state/#{user_id}", Jason.encode!(new_state))
  end
end
