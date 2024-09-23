defmodule RetroStation.Repo do
  use Ecto.Repo,
    otp_app: :retro_station,
    adapter: Ecto.Adapters.Postgres
end
