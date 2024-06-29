defmodule NativeDemoWeb.HomeLive do
  use NativeDemoWeb, :live_view

  use LiveViewNative.LiveView,
    formats: [:swiftui],
    layouts: [
      swiftui: {NativeDemoWeb.Layouts.SwiftUI, :app}
    ]

  def render(assigns) do
    ~H"""
    <div>
      Hello from Web <br />
      <br />
      <button
        phx-click="navigate"
        class="text-stone-100 bg-indigo-600 font-semibold rounded py-2.5 px-3 border border-indigo-600 transition hover:bg-indigo-700"
      >
        <.link href={~p"/counter"}>Go to counter example</.link>
      </button>
    </div>
    """
  end
end
