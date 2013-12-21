Dockerfile for running etcd on Ubuntu Trusty prerelease.

This container is on the [docker
index](https://index.docker.io/u/jroll/docker-trusty-etcd/).
It's a trusted build, which means it can only be built from this
repository.

### Usage

```shell
# pull the image down to be used later
$ docker pull jroll/docker-trusty-etcd

# run etcd
$ docker run -p 4001:4001 -p 7001:7001 jroll/docker-trusty-etcd
```

After using the above `docker run` command to start the container, etcd will
be available with the default ports (4001 and 7001) exposed to the host.
