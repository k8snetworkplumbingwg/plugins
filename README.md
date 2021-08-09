Container Networking Plugins

Build docker image of [containernetworking-plugins](https://github.com/containernetworking/plugins) with given release and architecture

Building image with default args, `BASE_IMAGE=alpine:3.14.0` `ARCH=amd64` and `VERSION=v0.9.1`
```
$ docker build -t k8snetworkplumbingwg/containernetworking-plugins .
```

Building with changing ARGS
```
$ docker build --build-arg BASE_IMAGE=<base-image> ARCH=<arch> --build-arg VERSION=<version> -t k8snetworkplumbingwg/containernetworking-plugins .
```
