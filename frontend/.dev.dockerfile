FROM node:12.12.0

RUN npm i -g yarn@1.19.1

USER node

WORKDIR /code

EXPOSE 3000

CMD yarn install && yarn start
