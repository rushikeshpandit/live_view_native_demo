defmodule NativeDemoWeb.HomeLive.SwiftUI do
  use NativeDemoNative, [:render_component, format: :swiftui]

  def render(assigns, _interface) do
    ~LVN"""
    <.header >
    Register
    </.header>
    <VStack id="hello-ios" class="background-blue">
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
