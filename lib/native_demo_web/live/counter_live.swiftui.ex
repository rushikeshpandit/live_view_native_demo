defmodule NativeDemoWeb.CounterLive.SwiftUI do
  use NativeDemoNative, [:render_component, format: :swiftui]

  def render(assigns, _interface) do
    ~LVN"""
    <.header>
      Workspace
      <:actions>
        <.link :if={!@current_user} navigate={~p"/users/register"} class="font-weight-semibold fg-tint">
          Sign in or register
        </.link>

      </:actions>
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
