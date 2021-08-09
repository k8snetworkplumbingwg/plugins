ARG BASE_IMAGE=centos:centos7

FROM ${BASE_IMAGE}

WORKDIR /

ARG VERSION=v0.9.1
ARG ARCH=amd64

RUN mkdir -p /usr/src/cni/bin && \
    wget https://github.com/containernetworking/plugins/releases/download/${VERSION}/cni-plugins-linux-${ARCH}-${VERSION}.tgz && \
    tar -xvf cni-plugins-linux-${ARCH}-${VERSION}.tgz -C /usr/src/cni/bin/ && \
    echo done

LABEL io.k8s.display-name="Container Network Plugins"

ADD ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
