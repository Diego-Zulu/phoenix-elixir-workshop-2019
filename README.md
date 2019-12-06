# Phoenix & Elixir Workshop 2019 at WyeWorks

Phoenix & Elixir Workshop I took part on December 7th 2019 at WyeWorks

## Requirements

- Docker 19.03.5
- Docker Compose 1.24.1

### Docker container dependencies

- Erlang 22.1
- Elixir 1.9.1
- Phoenix 1.4.10
- PostgreSQL 12.1
- NodeJS 12.12.0
- Yarn 1.19.1

## Getting Started

```docker-compose -f .dev.docker-compose.yml build```

```docker-compose -f .dev.docker-compose.yml up```

If you need to connect to the container:

```docker exec -it phoenix-elixir-workshop-2019_backend-dev_1 bash```
or
```docker exec -it phoenix-elixir-workshop-2019_fronted-dev_1 bash```
