defmodule Moneybear.Repo do
  use Ecto.Repo,
    otp_app: :moneybear,
    adapter: Ecto.Adapters.Postgres
end
