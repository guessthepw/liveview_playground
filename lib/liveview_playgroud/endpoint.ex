defmodule LiveviewPlayground.Endpoint do
  use Phoenix.Endpoint, otp_app: :liveview_playground

  plug Plug.Static, from: {:phoenix, "priv/static"}, at: "/assets/phoenix"
  plug Plug.Static, from: {:phoenix_live_view, "priv/static"}, at: "/assets/phoenix_live_view"

  socket "/live", Phoenix.LiveView.Socket
  plug :router

  defp router(conn, []) do
    config = Application.fetch_env!(:liveview_playground, __MODULE__)
    router = Keyword.fetch!(config, :router)
    router.call(conn, [])
  end
end
