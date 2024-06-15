defmodule NativeDemoWeb.HomeLive.SwiftUI do
  use NativeDemoNative, [:render_component, format: :swiftui]

  def render(assigns, _interface) do
    ~LVN"""
    <Text>Hello, SwiftUI!</Text>
    """
  end
end
