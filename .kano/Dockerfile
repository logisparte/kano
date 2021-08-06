FROM ghcr.io/logisparte/helot:3.1.0

LABEL name="kano-dev" \
    url="https://github.com/logisparte/kano" \
    author="logisparte" \
    author_email="info@logisparte.com" \
    description="Development image for kano"

ENV PATH="$PATH:/usr/local/go/bin:/root/go/bin"

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y -q --no-install-recommends \
    binutils-dev \
    cmake \
    gcc \
    g++ \
    libcurl4-openssl-dev \
    libdw-dev \
    libiberty-dev \
    make \
    nodejs \
    npm \
    shellcheck \
    zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g markdownlint-cli prettier \
    && mkdir -p /usr/local/opt \
    && cd /usr/local/opt \
    && SHELLSPEC_VERSION="0.28.1" \
    && curl -L "https://github.com/shellspec/shellspec/archive/$SHELLSPEC_VERSION.tar.gz" \
      | tar -xz \
    && mv "shellspec-$SHELLSPEC_VERSION" shellspec \
    && ln -s /usr/local/opt/shellspec/shellspec /usr/local/bin/shellspec \
    && KCOV_VERSION="38" \
    && curl -L "https://github.com/SimonKagstrom/kcov/archive/$KCOV_VERSION.tar.gz" \
      | tar -xz \
    && mv "kcov-$KCOV_VERSION" kcov \
    && mkdir kcov/build \
    && cd kcov/build \
    && cmake .. \
    && make \
    && make install \
    && cd / \
    && curl -L https://golang.org/dl/go1.16.linux-amd64.tar.gz \
      | tar -C /usr/local -xz \
    && GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt
