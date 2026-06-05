defmodule PhxPreviewWeb.PageLive do
  use PhxPreviewWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    # connected?(socket): dead render(HTTP)면 false, wss 마운트면 true.
    # true 면 1초 틱 시작 → 카운터 증가가 곧 101(wss 살아있음) 증거.
    if connected?(socket), do: Process.send_after(self(), :tick, 1000)
    {:ok, assign(socket, count: 0, connected: connected?(socket), marker: "PREVIEW E2E STATIC")}
  end

  @impl true
  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 1000)
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <main>
      <h1>{@marker}</h1>
      <p data-testid="wss-status">wss: {if @connected, do: "connected", else: "static"}</p>
      <span id="wss-tick"><%= @count %></span>
    </main>
    """
  end
end
