FROM erlang:22.1.8

ENV LANG C.UTF-8

RUN curl -s -O https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
    && dpkg -i erlang-solutions_2.0_all.deb \
    && apt-get update \
    && apt-get -y install elixir=1.9.1-1

RUN mix archive.install hex --force \
    && mix archive.install phx_new 1.4.10 --force

RUN groupadd --gid 1000 erlang \
  && useradd --uid 1000 --gid erlang --shell /bin/bash --create-home erlang

USER erlang

WORKDIR /code

EXPOSE 4000

CMD mix ecto.setup && iex -S mix phx.server
