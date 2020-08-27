FROM alpine:3.12

LABEL maintainer="AbyssViper<root@viper.run>"

ENV LANG=en_US.UTF-8 \
    BUILD_VERSION=v4.30-9700-beta

RUN wget https://github.com/AbyssViper/SoftEtherVPN/releases/download/${BUILD_VERSION}/softether-bin-${BUILD_VERSION}-viper.tar.gz \
    && echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories \
    && tar -zxvf softether-bin-${BUILD_VERSION}-viper.tar.gz \
    && rm -rf softether-bin-${BUILD_VERSION}-viper.tar.gz \
    && mv vpnserver /opt \
    && apk add --no-cache -U bash iptables openssl-dev

WORKDIR /opt/vpnserver

VOLUME ["/opt/vpnserver/server_log/", "/opt/vpnserver/packet_log/", "/opt/vpnserver/security_log/"]

EXPOSE 500/udp 4500/udp 1701/tcp 1194/udp 5555/tcp 443/tcp

CMD ["vpnserver", "start"]
