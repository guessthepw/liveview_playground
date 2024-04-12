defmodule LiveviewPlayground.Layout do
  use LiveviewPlaygroundWeb, :live_view

  def render("live.html", assigns) do
    assigns =
      assign_new(assigns, :scripts, fn ->
        Application.fetch_env!(:liveview_playground, :scripts)
      end)

    ~H"""
    <script :for={script <- @scripts} src={script}>
    </script>
    <script src="/assets/phoenix/phoenix.js"></script>
    <script src="/assets/phoenix_live_view/phoenix_live_view.js"></script>
    <script>
      let liveSocket = new window.LiveView.LiveSocket("/live", window.Phoenix.Socket)
      liveSocket.connect()
    </script>
    <style>
      * { font-size: 1.1em; }
    </style>
    <%= @inner_content %>
    """
  end

  def render(assigns) do
    ~H""
  end
end
