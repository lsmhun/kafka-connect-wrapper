FROM openjdk:13-jdk-alpine

RUN apk add --no-cache bash
RUN apk add --no-cache curl
RUN apk add --no-cache nano

COPY build/dependencies /opt/libs
COPY config /opt/config
COPY bin /opt/bin

VOLUME /opt/connect-config/worker
VOLUME /opt/connect-config/source
VOLUME /opt/connect-config/sink

# by default it will try to run the standalone, but other scripts can be used also
CMD ["/opt/bin/connect-default.sh" ]