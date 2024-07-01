defmodule NativeDemoWeb.HomeLive.SwiftUI do
  use NativeDemoNative, [:render_component, format: :swiftui]

  def render(assigns, _interface) do
    ~LVN"""
    <.header>
      Sign in to account
      <:subtitle>Sign in to account 11</:subtitle>
      <:actions>
        <.link navigate={~p"/users/register"} class="font-weight-semibold fg-tint">
          Sign up
        </.link>
      </:actions>
    </.header>
    <VStack id="hello-ios">
      <HStack>
        <Text class={["bold(true)"]} >Hello iOS!</Text>
      </HStack>
      <HStack>
        <.link  navigate={"/counter"} >
          <Text>Counter Demo</Text>
        </.link>
      </HStack>
      </VStack>
    """
  end
end
