defmodule NativeDemoWeb.UserRegistrationLive.SwiftUI do
  use NativeDemoNative, [:render_component, format: :swiftui]

  def render(assigns, _) do
    ~LVN"""
    <.header class="multiline-text-alignment-center">
      Register
      <:actions>
        <.link navigate={~p"/users/log_in"} class="font-weight-semibold fg-tint">
          Sign in
        </.link>
      </:actions>
    </.header>

    <.simple_form
      for={@form}
      id="registration_form"
      phx-submit="save"
      phx-change="validate"
      phx-trigger-action={@trigger_submit}
      action={~p"/users/log_in?_action=registered"}
      method="post"
    >
      <.error :if={@check_errors}>
        Oops, something went wrong! Please check the errors below.
      </.error>

      <.input field={@form[:email]} type="TextField" label="Email" class="keyboardType(.emailAddress)" autocomplete="off" />
      <.input field={@form[:password]} type="SecureField" label="Password" />

      <:actions>
        <.button type="submit">
          <Label>
            <Text template="title">Create an account</Text>
            <.image url={~p"/images/logo.png"}>
              <:empty></:empty>
              <:success class="rendering-mode-template resizable scaled-to-fit fg-white" />
              <:failure></:failure>
            </.image>
          </Label>
        </.button>
      </:actions>
    </.simple_form>
    """
  end
end
