defmodule NativeDemoWeb.Layouts.SwiftUI do
  use NativeDemoNative, [:layout, format: :swiftui]

  embed_templates "layouts_swiftui/*"
end
