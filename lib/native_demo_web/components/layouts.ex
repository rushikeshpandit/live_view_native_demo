defmodule NativeDemoWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use NativeDemoWeb, :controller` and
  `use NativeDemoWeb, :live_view`.
  """
  use NativeDemoWeb, :html
  # use LiveViewNative.Template

  # changed from `embed_templates "layouts/*"`
  embed_templates "layouts/*.html"
end
