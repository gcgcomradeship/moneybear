defmodule MoneybearWeb.Service.Setting do
  use MoneybearWeb, :services

  def init(user_id) do
    settings = %{
      token: false,
      menu: "general"
    }

    Redis.set("settings/#{env(user_id)}/#{user_id}", Jason.encode!(settings))
    settings
  end

  def env(user_id) do
    case Redis.get("env/#{user_id}") do
      nil ->
        env(user_id, "sandbox")
        "sandbox"

      env ->
        env
    end
  end

  def env(user_id, val) do
    Redis.set("env/#{user_id}", val)
  end

  def token(user_id, token) do
    encrypted_token = Cipher.encrypt(token)
    Redis.set("token/#{env(user_id)}/#{user_id}", encrypted_token)
  end

  def all(user_id) do
    "settings/#{env(user_id)}/#{user_id}"
    |> Redis.get()
    |> case do
      nil -> init(user_id)
      settings -> Jason.decode!(settings)
    end
  end

  def get(user_id, key) do
    case Redis.get("settings/#{env(user_id)}/#{user_id}") do
      nil -> init(user_id)
      json_settings -> Jason.decode!(json_settings)
    end
    |> Map.get(key)
  end

  def set(user_id, key, val) do
    env = env(user_id)

    settings =
      Redis.get("settings/#{env}/#{user_id}")
      |> Jason.decode!()
      |> Map.put(key, val)

    Redis.set("settings/#{env}/#{user_id}", Jason.encode!(settings))
  end
end
