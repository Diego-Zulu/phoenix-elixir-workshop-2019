FROM postgres:12.1

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y install curl

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs

RUN curl -s -O https://deb.nodesource.com/node_12.x/pool/main/n/nodejs/nodejs_12.12.0-1nodesource1_amd64.deb \
    && dpkg -i nodejs_12.12.0-1nodesource1_amd64.deb

RUN npm i -g yarn@1.19.1

RUN curl -s -O https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
    && dpkg -i erlang-solutions_2.0_all.deb \
    && apt-get update \
    && apt-get -y install esl-erlang=1:22.1.8-1 \
    && apt-get install elixir=1.9.1-1

RUN mix local.hex --force \
    && mix archive.install hex phx_new 1.4.10

USER postgres

WORKDIR /code

EXPOSE 3000
EXPOSE 4000

CMD cd frontend && yarn install && yarn start
