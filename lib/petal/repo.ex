defmodule Petal.Repo do
  use Ecto.Repo,
    otp_app: :petal,
    adapter: Ecto.Adapters.Postgres
end
