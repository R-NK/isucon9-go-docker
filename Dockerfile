FROM golang:latest
WORKDIR /app

RUN apt-get update \
 && apt-get install -y

COPY ./bench ./bench
COPY ./cmd ./cmd
COPY ./go.mod ./
COPY ./go.sum ./
COPY ./Makefile ./

RUN make