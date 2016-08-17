FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN set -xe \
    && apk add -U lighttpd \
    && rm -rf /var/cache/apk/* 

VOLUME /home/aria2
COPY lighttpd.conf /etc/

EXPOSE 3000
CMD set -xe \
    && lighttpd -D -f /etc/lighttpd.conf 
