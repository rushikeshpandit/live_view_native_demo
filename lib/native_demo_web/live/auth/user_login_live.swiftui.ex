defmodule NativeDemoWeb.UserLoginLive.SwiftUI do
  use NativeDemoNative, [:render_component, format: :swiftui]

  def render(assigns, _) do
    ~LVN"""
    <.header>
      Sign in to account
      <:actions>
        <.link navigate={~p"/users/register"} class="fontWeight(.semibold) fg-tint">
          Sign up
        </.link>
      </:actions>
    </.header>

    <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
      <Section>
        <.input class="keyboardType(.emailAddress)" field={@form[:email]} type="TextField" label="Email" />
        <.input field={@form[:password]} type="SecureField" label="Password" />

        <Group template="footer">
          <.link navigate={~p"/users/reset_password"} class="font-caption fontWeight(.semibold)">
            Forgot your password?
          </.link>
        </Group>
      </Section>

      <Section>
        <.input field={@form[:remember_me]} type="Toggle" label="Keep me logged in" />
      </Section>

      <:actions>
        <.button type="submit">
          <Text>Sign in<Text verbatim=" " /><Image systemName="arrow.right" /></Text>
        </.button>
      </:actions>
    </.simple_form>
    """
  end
end
