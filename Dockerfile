FROM alpine:3.15

MAINTAINER Andre Sartori <andre@aphinfo.com.br>

COPY ./files /usr/local/bin

RUN apk add --no-cache openvpn git openssl iptables
RUN git clone https://github.com/OpenVPN/easy-rsa.git /tmp/easy-rsa
RUN apk del git
RUN cp -a /tmp/easy-rsa /usr/local/share/
RUN ln -s /usr/local/share/easy-rsa/easyrsa3/easyrsa /usr/local/bin
RUN chmod 774 /usr/local/bin/*

EXPOSE 1194/udp

WORKDIR /etc/openvpn

CMD /bin/sh
