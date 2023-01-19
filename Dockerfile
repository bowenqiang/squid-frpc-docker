ARG VERSION=0.42.0
ARG ARCH=amd64
FROM alpine/curl as bin
ARG VERSION=0.42.0
ARG ARCH=amd64
RUN curl -L -o frp.tar.gz https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_${ARCH}.tar.gz
RUN tar xzf frp.tar.gz 
RUN mv frp_${VERSION}_linux_${ARCH}/frpc /usr/bin/frpc 

FROM ubuntu/squid
RUN apt update &&\
    apt install -y supervisor curl
COPY --from=bin /usr/bin/frpc /usr/bin/frpc
COPY rootfs/ /
