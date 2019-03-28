defmodule Xcms.Repo do
  use Ecto.Repo,
    otp_app: :xcms,
    adapter: Ecto.Adapters.Postgres
end
