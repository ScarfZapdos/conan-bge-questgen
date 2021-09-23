# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /src
EXPOSE 5000
COPY . .
CMD ["python3", "adventuresawaitbge.py"]
