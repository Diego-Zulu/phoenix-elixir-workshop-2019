FROM erlang:22.1.8

ENV LANG C.UTF-8

RUN curl -s -O https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
    && dpkg -i erlang-solutions_2.0_all.deb \
    && apt-get update \
    && apt-get -y install elixir=1.9.1-1

RUN groupadd --gid 1000 erlang \
  && useradd --uid 1000 --gid erlang --shell /bin/bash --create-home erlang

USER erlang

RUN mix local.hex --force \
    && mix archive.install hex phx_new 1.4.10 --force

WORKDIR /code

EXPOSE 4000

CMD mix ecto.setup && mix phx.server
