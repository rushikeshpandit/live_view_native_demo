# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :native_demo,
  ecto_repos: [NativeDemo.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :native_demo, NativeDemoWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: NativeDemoWeb.ErrorHTML, json: NativeDemoWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: NativeDemo.PubSub,
  live_view: [signing_salt: "qZuu3PUu"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :native_demo, NativeDemo.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  native_demo: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.0",
  native_demo: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# LVN - Required
# Registers each available plugin
config :live_view_native,
  plugins: [
    LiveViewNative.SwiftUI,
    LiveViewNative.Jetpack
  ]

# LVN - Required
# Each format must be registered as a mime type add to
# existing configuration if one exists as this will overwrite
config :mime, :types, %{
  "text/swiftui" => ["swiftui"],
  "text/jetpack" => ["jetpack"],
  "text/styles" => ["styles"]
}

# LVN - Required
# Phoenix must know how to encode each LVN format
config :phoenix_template, :format_encoders,
  swiftui: Phoenix.HTML.Engine,
  jetpack: Phoenix.HTML.Engine

# LVN - Required
# Phoenix must know how to compile neex templates
config :phoenix, :template_engines, neex: LiveViewNative.Engine

# LiveView Native Stylesheet support
# Omit this if you're not using platforms that support LiveView
# Native stylesheets
config :live_view_native_stylesheet,
  parsers: [
    swiftui: LiveViewNative.SwiftUI.RulesParser
  ]

# LVN - Required, you must configure LiveView Native Stylesheets
# on where class names shoudl be extracted from
config :live_view_native_stylesheet,
  content: [
    swiftui: [
      "lib/**/*swiftui*"
    ],
    jetpack: [
      "lib/**/*jetpack*"
    ]
  ],
  output: "priv/static/assets"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
