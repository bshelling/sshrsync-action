FROM alpine:3.10

RUN apk update && apk add rsync openssh-client
RUN mkdir .ssh
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
