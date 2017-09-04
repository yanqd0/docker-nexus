# docker-nexus

This is an [Alpine] alternative of [Nexus Repository OSS].
There is also an [official one][nexus3] available.

[Alpine]:https://www.alpinelinux.org/
[Nexus Repository OSS]:https://www.sonatype.com/nexus-repository-oss
[nexus3]:https://hub.docker.com/r/sonatype/nexus3/

## Install

[![Docker Build Status](https://img.shields.io/docker/build/yanqd0/nexus.svg)](https://hub.docker.com/r/yanqd0/nexus/builds/)
[![Docker Automated build](https://img.shields.io/docker/automated/yanqd0/nexus.svg)](https://hub.docker.com/r/yanqd0/nexus/builds/)
[![Docker Stars](https://img.shields.io/docker/stars/yanqd0/nexus.svg)](https://hub.docker.com/r/yanqd0/nexus/)
[![Docker Pulls](https://img.shields.io/docker/pulls/yanqd0/nexus.svg)](https://hub.docker.com/r/yanqd0/nexus/)

```sh
docker pull yanqd0/nexus
```

## Version

| Name   | Version      |
| ----   | ------:      |
| Alpine | latest (3.6) |
| JRE    | 8.131.11-r2  |
| Nexus  | 3.5.1-02     |

It is welcome to remind me about updates with [issues].

[issues]:https://github.com/yanqd0/docker-nexus/issues/new

## Size

| Status     | Size                                |
| ------     | ---:                                |
| Compressed | [![][microbadger.svg]][microbadger] |
| Extracted  | 198 MB                              |

I use the official [releases] instead of compiling from source, so the image is very small.

[microbadger.svg]:https://images.microbadger.com/badges/image/yanqd0/nexus.svg
[microbadger]:https://microbadger.com/images/yanqd0/nexus

## License

[![License](https://img.shields.io/github/license/yanqd0/docker-nexus.svg)](https://github.com/yanqd0/docker-nexus/blob/master/LICENSE)

> MIT License
>
> Copyright (c) 2017 Yan QiDong <yanqd0@outlook.com>
