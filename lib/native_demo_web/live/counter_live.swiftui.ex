defmodule NativeDemoWeb.CounterLive.SwiftUI do
  use NativeDemoNative, [:render_component, format: :swiftui]

  def render(assigns, _interface) do
    ~LVN"""
    <.header>
      Counter
    </.header>

      <HStack>
        <Text class={["bold(true)"]}>This button has been pressed <%= @count %> times.</Text>
      </HStack>
      <HStack>
        <Button phx-click="increment-count">
          <Text >Press me</Text>
        </Button>
      </HStack>
    """
  end
end
