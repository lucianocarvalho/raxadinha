# Raxadinha

Raxadinha is a API REST in PHP created to help people to easily split bills and expenses with friends, partner, housemates or anyone interested. You can record debts, calculate total payments and simplify your budget.

> Raxadinha comes from the brazilian verb **rachar**, that means, in a informal dictionary, divide something proportionally between several people or share something.

## Table of contents:
* **[About](#about)**
* **[Installation](#installation)**
* **[Documentation](#documentation)**
* **[Bugs and features](#bugs-and-features)**
* **[License](#license)**

## About

#### Requirements

Raxadinha is a PHP project so you can easily run it anywhere.

However, to easily setup it locally you will need:

- **[Docker](https://www.docker.com/)** working in your machine.
- **[docker-compose](https://docs.docker.com/compose/)** already installed.

#### Containers

| Container             | About                | Port |
|-----------------------|----------------------|------|
| **api.raxadinha.dev** | `php:7.4-fpm-alpine` | 9002 |
| **db.raxadinha.dev**  | `postgres`           | 5432 |

## Installation

#### Setting up the local environment using Docker:

```bash
# Clone the repository
$ git clone https://github.com/lucianocarvalho/raxadinha && cd raxadinha

# Rename .env.example to .env
$ cp src/.env.example src/.env

# Setup the containers
$ docker-compose up -d

# Install the dependencies using composer
$ docker exec -ti api.raxadinha.dev composer install

# Run the migrations
$ docker exec -ti api.raxadinha.dev php artisan migrate

# If you want, run the seeds
$ docker exec -ti api.raxadinha.dev php artisan db:seed

# Run the tests
$ docker exec -ti api.raxadinha.dev ./vendor/bin/phpunit
```

#### Deploy on Kubernetes:
```bash
kubectl apply -f https://raw.githubusercontent.com/lucianocarvalho/raxadinha/k8s/deployment.yaml
```

## Documentation

We use [OpenAPI](https://swagger.io/specification/) to generate and [ReDoc](https://github.com/Redocly/redoc) to view the documentation.

Generate the documentation:
```bash
$ docker exec -ti api.raxadinha.dev ./vendor/bin/openapi ./app/ --output public/openapi/openapi.json
```

Open **[http://localhost:9002/openapi/redoc.html](http://localhost:9002/openapi/redoc.html)** in your browser.

## Bugs and features:

This project tracks issues and feature requests using the GitHub issue tracker.

Feel free to [create a new issue](https://github.com/lucianocarvalho/raxadinha/issues) or [send a pull request](https://github.com/lucianocarvalho/raxadinha/pulls).

## License

This project is free and open source software, distributed under the The MIT License. So feel free to use this to create your site without linking back to me or using a disclaimer.