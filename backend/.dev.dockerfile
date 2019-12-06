FROM postgres:12.1

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y install curl

RUN curl -s -O https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
    && dpkg -i erlang-solutions_2.0_all.deb \
    && apt-get update \
    && apt-get -y install esl-erlang=1:22.1.8-1 \
    && apt-get install elixir=1.9.1-1

RUN mix local.hex --force \
    && mix archive.install hex phx_new 1.4.10

USER postgres

WORKDIR /code

EXPOSE 4000
