# ksunami-docker

A Docker wrapper for [Ksunami]. 
Grub the image from [Docker Hub `kafkesc/ksunami`](https://hub.docker.com/r/kafkesc/ksunami)

```shell
$ docker pull kafkesc/ksunami
```

## Usage

Running `ksunami` from inside a docker container, couldn't be any easier:

```shell
$ docker run kafkesc/ksunami -h
Produce constant, configurable, cyclical waves of Kafka Records

Usage: ksunami ...
```

Given the docker container is purposely designed to be a _thin wrapper_,
if you are looking for [usage instructions](https://github.com/kafkesc/ksunami#usage),
[examples](https://github.com/kafkesc/ksunami#examples) or learn
more about [core concepts](https://github.com/kafkesc/ksunami#core-concepts),
please consult [Ksunami] repo itself.

## Versioning

The `kafkesc/ksunami` docker image version will match [Ksunami]
[released versions](https://crates.io/crates/ksunami/versions).

Following Docker approach, `kafkesc/ksunami:latest` will be a moving tag, pointing at the latest release.
All other versions (current and previous) will be available as `kafkesc/ksunami:vX.Y.Z`.

### Release process

Once a new [Ksunami] [version](https://crates.io/crates/ksunami/versions) is released to [crates.io],
the only thing to do should be to create a commit (even empty) against this repository,
with tag equivalent to the one used to [release Ksunami](https://github.com/kafkesc/ksunami/releases).

For example, if `ksunami@v1.2.3` has just been released, just do:

```shell
$ make release tag=v1.2.3
```

## License

Licensed under either of

* Apache License, Version 2.0
  ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
* MIT license
  ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.

[Ksunami]: https://github.com/kafkesc/ksunami
[Docker]: https://www.docker.com/
[crates.io]: https://crates.io/crates/ksunami