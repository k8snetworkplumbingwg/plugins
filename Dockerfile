ARG BASE_IMAGE=centos:centos7

FROM ${BASE_IMAGE}

WORKDIR /

ARG VERSION=v1.3.0
ARG TARGETARCH
ENV TARGETARCH=${TARGETARCH:-amd64}

RUN mkdir -p /usr/src/cni/bin && \
    curl -L -O https://github.com/containernetworking/plugins/releases/download/${VERSION}/cni-plugins-linux-${TARGETARCH}-${VERSION}.tgz && \
    tar -xvf cni-plugins-linux-${TARGETARCH}-${VERSION}.tgz -C /usr/src/cni/bin/ && \
    echo done

LABEL io.k8s.display-name="Container Network Plugins"

ADD ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
