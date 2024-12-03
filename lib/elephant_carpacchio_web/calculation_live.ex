defmodule ElephantCarpacchioWeb.CalculationLive do
  use ElephantCarpacchioWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <.header>TODO: lots of stuff</.header>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
