FROM alpine:latest
ADD . /app
WORKDIR /app
ENTRYPOINT [ "/app/hello" ]
