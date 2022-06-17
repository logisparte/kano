FROM ghcr.io/logisparte/helot:4.2.0

LABEL org.opencontainers.image.title="kano-dev"
LABEL org.opencontainers.image.description="kano's development image"
LABEL org.opencontainers.image.authors="@logisparte"
LABEL org.opencontainers.image.source="https://github.com/logisparte/kano"

ARG TARGETARCH

ENV PATH="$PATH:/root/.local/bin:/usr/local/go/bin:/root/go/bin"

COPY .kano/installers installers

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    # markdownlint & prettier
    && apt-get install -y -q --no-install-recommends \
      nodejs \
      npm \
    && npm install -g markdownlint-cli prettier \
    # shellcheck
    && apt-get install -y -q --no-install-recommends \
      shellcheck \
    # shfmt
    && ./installers/go "$TARGETARCH" \
    && go install mvdan.cc/sh/v3/cmd/shfmt@v3.5.1 \
    # shellspec
    && curl -fsSL https://git.io/shellspec \
      | sh -s 0.28.1 --yes \
    # kcov
    && KCOV_VERSION="40" \
    && apt-get install -y -q --no-install-recommends \
      binutils-dev \
      clang \
      cmake \
      libcurl4-openssl-dev \
      libdw-dev \
      libiberty-dev \
      make \
      zlib1g-dev \
    && curl -L "https://github.com/SimonKagstrom/kcov/archive/refs/tags/v$KCOV_VERSION.tar.gz" \
      | tar -xz \
    && mv "kcov-$KCOV_VERSION" kcov \
    && mkdir -p kcov/build \
    && cd kcov/build \
    && cmake -DCMAKE_C_FLAGS:STRING="-O3" -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && make install \
    && cd / \
    # cleanup
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf ./installers
