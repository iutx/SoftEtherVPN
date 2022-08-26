FROM abyssviper/softethervpn:v4.39-9772-src as build

LABEL maintainer="iutx<root@viper.run>"

ENV VERSION="v4.39-9772"

WORKDIR /opt

RUN tar -zxvf softether-src-${VERSION}-plus.tar.gz \
    && cd ${VERSION} \
    && apk add --no-cache -U build-base ncurses-dev openssl-dev readline-dev zlib-dev \
    && ./configure \
    && make \
    && mv bin /opt

FROM alpine:3.16

LABEL maintainer="iutx<root@viper.run>"

ENV LANG=en_US.UTF-8
ENV VERSION="v4.39-9772"

WORKDIR /opt/vpnserver

COPY --from=build /opt/bin/vpnserver .

RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.16/main/" > /etc/apk/repositories \
    && apk add --no-cache -U bash iptables openssl-dev

VOLUME ["/opt/vpnserver/server_log/", "/opt/vpnserver/packet_log/", "/opt/vpnserver/security_log/"]

EXPOSE 500/udp 4500/udp 1701/tcp 1194/udp 5555/tcp 443/tcp

CMD ["./vpnserver", "execsvc"]
