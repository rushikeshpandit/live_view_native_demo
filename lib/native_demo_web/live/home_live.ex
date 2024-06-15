defmodule NativeDemoWeb.HomeLive do
  use NativeDemoWeb, :live_view

  use LiveViewNative.LiveView,
    formats: [:swiftui],
    layouts: [
      swiftui: {NativeDemoWeb.Layouts.SwiftUI, :app}
    ]

  def render(assigns) do
    ~H"""
    Hello from Web
    """
  end
end
