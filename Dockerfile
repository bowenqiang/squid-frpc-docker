ARG VERSION ARCH
FROM alpine as bin
ARG VERSION ARCH
ENV VERSION=${VERSION:-0.42.0}  ARCH=${ARCH:-amd64}
#RUN curl -L -o frp.tar.gz https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_${ARCH}.tar.gz
RUN wget -O frp.tar.gz https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_${ARCH}.tar.gz
RUN tar xzf frp.tar.gz 
RUN mv frp_${VERSION}_linux_${ARCH}/frpc /usr/bin/frpc 

FROM alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache --update squid supervisor curl
COPY --from=bin /usr/bin/frpc /usr/bin/frpc
COPY rootfs/ /
