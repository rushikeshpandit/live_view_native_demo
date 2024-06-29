defmodule NativeDemoWeb.CounterLive do
  use NativeDemoWeb, :live_view

  use LiveViewNative.LiveView,
    formats: [:swiftui],
    layouts: [
      swiftui: {NativeDemoWeb.Layouts.SwiftUI, :app}
    ]

  alias NativeDemo.Counter

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div class="text-slate-800 bg-slate-50 content-center items-center text-center">
        <.back navigate={~p"/home"}>Back to Home</.back>
        <div class="mb-2.5">This button has been clicked <%= @count %> times.</div>
        <div>
          <button
            phx-click="increment-count"
            class="text-stone-100 bg-indigo-600 font-semibold rounded py-2.5 px-3 border border-indigo-600 transition hover:bg-indigo-700"
          >
            <span>Click me</span>
          </button>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    Counter.join(self())

    {:ok, assign(socket, :count, Counter.get_count())}
  end

  @impl true
  def handle_info({:count_changed, count}, socket) do
    {:noreply, assign(socket, :count, count)}
  end

  @impl true
  def handle_event("increment-count", _params, socket) do
    NativeDemo.Counter.increment_count()

    {:noreply, socket}
  end
end
