# syntax=docker/dockerfile:1
FROM python:3.7-alpine
RUN apt-get update && apt-get -y install cmake protobuf-compiler
WORKDIR /src
EXPOSE 5000
COPY . .
CMD ["python3", "adventuresawaitbge.py"]
CMD ["echo", "Hello World"]
