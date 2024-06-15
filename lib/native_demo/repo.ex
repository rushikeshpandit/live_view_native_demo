defmodule NativeDemo.Repo do
  use Ecto.Repo,
    otp_app: :native_demo,
    adapter: Ecto.Adapters.Postgres
end
