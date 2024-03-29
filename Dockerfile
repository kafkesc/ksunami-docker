ARG BASE_IMG=rust
ARG BASE_IMG_VERSION=1.68-slim-bullseye

FROM $BASE_IMG:$BASE_IMG_VERSION
ARG BASE_IMG
ARG BASE_IMG_VERSION
ARG KSUNAMI_VERSION

LABEL base.image=$BASE_IMG:$BASE_IMG_VERSION \
    name=ksunami \
    version=$KSUNAMI_VERSION \
    description="Produce constant, configurable, cyclical waves of Kafka Records" \
    repository="https://github.com/kafkesc/ksunami" \
    homepage="https://github.com/kafkesc/ksunami" \
    license="MIT OR Apache-2.0"

ENV BUILD_DEPS "tcl-dev libssl-dev libsasl2-dev"
ENV CARGO_REGISTRIES_CRATES_IO_PROTOCOL "sparse"

# Setup
RUN \
	apt update && \
	apt install -y ${BUILD_DEPS}

# Build
RUN \
	cargo install --version "${KSUNAMI_VERSION#v}" ksunami

# Cleanup
RUN \
    rm -rf /usr/local/cargo/registry && \
    apt remove --purge -y ${BUILD_DEPS} && \
	apt autoremove -y && \
	apt autoclean -y && \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["ksunami"]