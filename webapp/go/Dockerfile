FROM golang:latest
WORKDIR /app

RUN apt-get update \
 && apt-get install -y \
    mariadb-client \
    less

COPY ./go /app/
COPY ./frontend/public /public