FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y -q --no-install-recommends \
    gnupg \
    software-properties-common \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 \
    && apt-add-repository https://cli.github.com/packages \
    && apt-get install -y -q --no-install-recommends \
    binutils-dev \
    ca-certificates \
    cmake \
    curl \
    gcc \
    gh \
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
    && curl -L "https://github.com/SimonKagstrom/kcov/archive/$KCOV_VERSION.tar.gz" | tar -xz \
    && mv "kcov-$KCOV_VERSION" kcov \
    && mkdir kcov/build \
    && cd kcov/build \
    && cmake .. \
    && make \
    && make install \
    && cd / \
    && curl -L https://golang.org/dl/go1.16.linux-amd64.tar.gz | tar -C /usr/local -xz \
    && echo "export PATH=\"\$PATH:/usr/local/go/bin\"" >> "$HOME/.profile" \
    && echo "export PATH=\"\$PATH:/root/go/bin\"" >> "$HOME/.profile" \
    && . "$HOME/.profile" \
    && GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt
