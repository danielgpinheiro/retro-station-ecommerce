defmodule RetroStationWeb.HomeLive do
  use RetroStationWeb, :live_view

  alias RetroStationWeb.Shared.Header.HeaderComponent

  def render(assigns) do
    ~H"""
    <main id="games">
      <.live_component module={HeaderComponent} id={:header} />
    </main>
    """
  end

  def mount(_, _, socket) do
    {:ok, socket}
  end
end
