# inception

A Docker-based infrastructure project, written as part of the School 42 curriculum.

## What it does

Inception sets up a small web infrastructure using Docker Compose. Each service runs in its own container built from a Debian or Alpine base image. No pre-built images from Docker Hub are used.

## Services

- **Nginx** — handles HTTPS connections and serves as the entry point
- **WordPress** — the web application, running with php-fpm
- **MariaDB** — the database used by WordPress

All services communicate through a Docker network. Data is persisted using Docker volumes.

## Requirements

- Docker
- Docker Compose
- A valid domain name pointing to the host (configured via `/etc/hosts` for local use)

## Usage

```sh
make
```

This builds the images and starts the containers. The site is then accessible at `https://login.42.fr` (replace `login` with your 42 login).

```sh
make down   # stop and remove containers
make clean  # remove containers and volumes
```

## Project context

This is a School 42 project. The goal is to understand containerization, Docker networking, volumes, and how to set up a multi-service infrastructure from scratch without relying on ready-made images.
