defmodule DemoLiveview.Repo do
  use Ecto.Repo,
    otp_app: :demo_liveview,
    adapter: Ecto.Adapters.Postgres
end
