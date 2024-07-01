defmodule NativeDemoWeb.HomeLive.SwiftUI do
  use NativeDemoNative, [:render_component, format: :swiftui]

  def render(assigns, _interface) do
    ~LVN"""
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
