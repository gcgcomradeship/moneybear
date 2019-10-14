defmodule MoneybearWeb.Service.Token do
  use MoneybearWeb, :services

  def set(user_id, token) do
    case Request.register(user_id, token) do
      true ->
        encrypted_token = Cipher.encrypt(token)
        Redis.set("token/#{Setting.env(user_id)}/#{user_id}", encrypted_token)
        Setting.set(user_id, "token", true)
        :ok

      false ->
        :error
    end
  end

  def get(user_id) do
    "token/#{Setting.env(user_id)}/#{user_id}"
    |> Redis.get()
    |> case do
      nil -> nil
      encrypted_token -> Cipher.decrypt(encrypted_token)
    end
  end

  def delete(user_id) do
    Redis.delete("token/#{Setting.env(user_id)}/#{user_id}")
    Setting.set(user_id, "token", false)
  end
end
