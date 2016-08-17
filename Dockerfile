FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN set -xe \
    && apk add -U lighttpd \
    && rm -rf /var/cache/apk/* 

VOLUME /home/aria2
COPY lighttpd.conf /etc/

EXPOSE 80
CMD set -xe \
    && chown -R aria2:aria2 /home/aria2 \
    && gosu aria2 aria2c --conf-path=/etc/aria2/aria2.conf \
                         --rpc-secret=${TOKEN}
