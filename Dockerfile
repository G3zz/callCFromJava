FROM openjdk:8-jdk-alpine AS builder
RUN mkdir -p /usr/local/callCFromJava
COPY . /usr/local/callCFromJava
WORKDIR /usr/local/callCFromJava
RUN apk update && apk add gcc libc-dev make
RUN make classes
CMD java App
