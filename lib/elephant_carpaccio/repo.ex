defmodule ElephantCarpaccio.Repo do
  use Ecto.Repo,
    otp_app: :elephant_carpaccio,
    adapter: Ecto.Adapters.Postgres
end
