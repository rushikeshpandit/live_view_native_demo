defmodule NativeDemoWeb.Layouts.Jetpack do
  use NativeDemoNative, [:layout, format: :jetpack]

  embed_templates "layouts_jetpack/*"
end
