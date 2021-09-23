# syntax=docker/dockerfile:1
FROM python:3.8-buster
RUN apt-get update
RUN apt-get -y install build-essential
RUN apt-get -y install cmake protobuf-compiler
WORKDIR /hm-questgen
EXPOSE 5000
COPY . .
CMD ["./init.sh"]