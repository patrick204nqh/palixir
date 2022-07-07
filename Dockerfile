FROM elixir:1.13.4-otp-25-slim

WORKDIR /var/www/backend

COPY mix.exs .
COPY mix.lock .
COPY . ./

ENTRYPOINT mix local.hex --force && mix deps.get && mix phx.server