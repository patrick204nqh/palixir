FROM elixir:1.13.4-otp-25-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \ 
  git \
  wget \
  ca-certificates \
  curl \
  make \
  gcc \
  g++ \
  python && \
  update-ca-certificates --fresh && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  mix local.rebar --force && \
  mix local.hex --force && \
  mix hex.info
  
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get install -y yarn

WORKDIR /var/www/backend

COPY mix.exs .
COPY mix.lock .
COPY . ./

RUN mix local.hex --force

ENTRYPOINT mix deps.get && iex -S mix phx.server