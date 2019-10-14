defmodule MoneybearWeb.Service.Request do
  use MoneybearWeb, :services

  def host("sandbox"), do: "https://api-invest.tinkoff.ru/openapi/sandbox"
  def host("reality"), do: "https://api-invest.tinkoff.ru/openapi/"
  # def header(), do: [{"Authorization", "Bearer asdasdas"}]

  def header(user_id) when is_integer(user_id),
    do: [{"Authorization", "Bearer #{Token.get(user_id)}"}]

  def header(token), do: [{"Authorization", "Bearer #{token}"}]

  def call() do
    "#{host(Setting.env(1))}/orders"
    |> HTTPoison.get(header(1))
  end

  def register(user_id, token) do
    case Setting.env(user_id) do
      "sandbox" = env ->
        "#{host(env)}/sandbox/register"
        |> HTTPoison.post("", header(token))

      "reality" = env ->
        "#{host(env)}/portfolio"
        |> HTTPoison.get(header(token))
    end
    |> decode_response()
    |> case do
      {:ok, _} -> true
      _ -> false
    end
  end

  defp decode_response(response) do
    case response do
      {:ok, %{body: body, status_code: 200}} -> {:ok, body}
      {:ok, %{body: body, status_code: code}} -> {:error, code, body}
      {:error, _data} -> {:error, 0, "Unknown error."}
    end
  end
end
