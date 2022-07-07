defmodule Palixir.Repo do
  use Ecto.Repo,
    otp_app: :palixir,
    adapter: Ecto.Adapters.Postgres
end
