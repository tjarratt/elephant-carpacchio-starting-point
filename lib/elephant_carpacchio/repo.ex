defmodule ElephantCarpacchio.Repo do
  use Ecto.Repo,
    otp_app: :elephant_carpacchio,
    adapter: Ecto.Adapters.Postgres
end
