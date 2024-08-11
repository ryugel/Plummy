defmodule PlummyApi.Repo do
  use Ecto.Repo,
    otp_app: :plummy_api,
    adapter: Ecto.Adapters.Postgres
end
