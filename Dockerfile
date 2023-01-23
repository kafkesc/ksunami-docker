ARG BASE_IMG=rust
ARG BASE_IMG_VERSION=1.66.1-slim-bullseye
ARG KSUNAMI_VERSION=0.1.6

FROM $BASE_IMG:$BASE_IMG_VERSION
ARG BASE_IMG
ARG BASE_IMG_VERSION
ARG KSUNAMI_VERSION

LABEL base.image=$BASE_IMG:$BASE_IMG_VERSION
LABEL name=ksunami
LABEL version=$KSUNAMI_VERSION
LABEL description="Produce constant, configurable, cyclical waves of Kafka Records"
LABEL repository="https://github.com/kafkesc/ksunami"
LABEL homepage="https://github.com/kafkesc/ksunami"
LABEL license="MIT OR Apache-2.0"

ENV BUILD_DEPS "tcl-dev libssl-dev libsasl2-dev"

# Setup
RUN \
	apt update && \
	apt install -y ${BUILD_DEPS}

# Build
RUN \
	cargo install --version ${KSUNAMI_VERSION} ksunami

# Cleanup
RUN \
	apt autoremove -y && \
	apt autoclean -y && \
	rm -rf /var/lib/apt/lists/*