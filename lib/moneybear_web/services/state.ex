defmodule MoneybearWeb.Service.State do
  use MoneybearWeb, :services

  def get(user_id) do
    case Redis.get("state/#{Setting.env(user_id)}/#{user_id}") do
      nil -> init(user_id)
      json_state -> Jason.decode!(json_state)
    end
  end

  def set(state, user_id) do
    Redis.set("state/#{Setting.env(user_id)}/#{user_id}", Jason.encode!(state))
  end

  def init(user_id) do
    new_state = %{
      page: "manager"
    }

    Redis.set("state/#{Setting.env(user_id)}/#{user_id}", Jason.encode!(new_state))
  end
end
