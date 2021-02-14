# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

if config_env() == :prod do

  database_url =
    System.get_env("DATABASE_URL") ||
      raise """
      environment variable DATABASE_URL is missing.
      For example: ecto://USER:PASS@HOST/DATABASE
      """

  config :petal, Petal.Repo,
    # ssl: true,
    url: database_url,
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
    """

  # Delete the other conditions you don't need. For each deployment
  # there may be other files to delete. They should be listed here.
  cond do
    app_name = System.get_env("APP_NAME") ->
      # Heroku deployment
      # Files needed:
      #  - ./Procfile
      #  - ./elixir_buildpack.config
      #  - ./phoenix_static_buildpack.config
      config :petal, PetalWeb.Endpoint,
        url: [host: "#{app_name}.herokuapp.com", port: 443],
        force_ssl: [rewrite_on: [:x_forwarded_proto]],
        server: true,
        http: [
          port: String.to_integer(System.get_env("PORT") || "4000"),
          transport_options: [socket_opts: [:inet6]]
        ],
        secret_key_base: secret_key_base

    host = System.get_env("RENDER_EXTERNAL_HOSTNAME") ->
      # Render deployment
      # Files needed:
      #  - ./bin/render-build.sh
      #  - ./render.ym1
      config :petal, PetalWeb.Endpoint,
        url: [host: host, port: 80],
        force_ssl: [rewrite_on: [:x_forwarded_proto]],
        server: true,
        http: [
          port: String.to_integer(System.get_env("PORT") || "4000"),
          transport_options: [socket_opts: [:inet6]]
        ],
        secret_key_base: secret_key_base

    host = System.get_env("HOST") ->
      # VPS deployment
      # Files needed:
      #  - ./priv/nginx.conf
      #  - ./priv/systemd.service
      #  - ./Dockerfile
      config :petal, PetalWeb.Endpoint,
        url: [host: host, port: 443],
        force_ssl: [rewrite_on: [:x_forwarded_proto]],
        server: true,
        http: [
          port: String.to_integer(System.get_env("PORT") || "4000"),
          transport_options: [socket_opts: [:inet6]]
        ],
        secret_key_base: secret_key_base
  end
end
