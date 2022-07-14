# syntax=docker/dockerfile:1
FROM ghcr.io/logisparte/helot-22.04:6.0.0 AS base

LABEL org.opencontainers.image.title="kano-dev"
LABEL org.opencontainers.image.description="kano's development image"
LABEL org.opencontainers.image.authors="@logisparte"
LABEL org.opencontainers.image.source="https://github.com/logisparte/kano"

RUN sudo apt-get update

FROM base AS markdownlint_prettier

RUN <<eof
  curl --silent --show-error --location https://deb.nodesource.com/setup_lts.x \
    | sudo bash -
  DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes --quiet --no-install-recommends \
    nodejs
  sudo npm config set update-notifier=false fund=false
  sudo npm install --location=global --no-optional \
    markdownlint-cli@0.31.1 \
    prettier@2.7.1
  sudo npm cache clean --force
eof

FROM markdownlint_prettier AS shfmt

ARG TARGETARCH

ENV GOBIN="/usr/bin"
ENV GOPATH="/usr/lib/go"
ENV GOPROXY="direct"

RUN <<eof
  case "$TARGETARCH" in
    amd64)
      GO_ARCHITECTURE="amd64"
      ;;

    arm64*)
      GO_ARCHITECTURE="arm64"
      ;;

    *)
      echo "Unknown target architecture: $TARGETARCH" >&2
      exit 1
      ;;
  esac

  curl --silent --show-error --location \
    "https://golang.org/dl/go1.18.3.linux-$GO_ARCHITECTURE.tar.gz" \
      | sudo tar --directory /opt --extract --gzip
  sudo ln -s "/opt/go/bin/go" "/usr/bin/go"
  sudo -E go install mvdan.cc/sh/v3/cmd/shfmt@v3.5.1
  sudo -E go clean --cache
eof

FROM shfmt AS shellcheck

RUN <<eof
  DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes --quiet --no-install-recommends \
    shellcheck
eof

FROM shellcheck AS shellspec

RUN <<eof
  curl --silent --show-error --location https://git.io/shellspec \
    | sudo sh -s 0.28.1 --dir /opt/shellspec --bin /usr/bin --yes
eof

FROM base AS kcov_builder

RUN <<eof
  KCOV_VERSION="40"
  KCOV_DIRECTORY="kcov-$KCOV_VERSION"
  KCOV_BUILD_DIRECTORY="$KCOV_DIRECTORY/build"
  DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes --quiet --no-install-recommends \
    binutils-dev \
    build-essential \
    cmake \
    libcurl4-openssl-dev \
    libdw-dev \
    libiberty-dev \
    libssl-dev \
    zlib1g-dev
  curl --silent --show-error --location \
    "https://github.com/SimonKagstrom/kcov/archive/refs/tags/v$KCOV_VERSION.tar.gz" \
      | sudo tar --extract --gzip
  sudo cmake -B "$KCOV_BUILD_DIRECTORY" -Wno-dev "$KCOV_DIRECTORY"
  sudo cmake --build "$KCOV_BUILD_DIRECTORY" --target install
eof

FROM shellspec AS kcov

COPY --from=kcov_builder /usr/local/bin/kcov* /usr/bin/

RUN <<eof
  DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes --quiet --no-install-recommends \
    binutils \
    libcurl4 \
    libdw1 \
    zlib1g
eof

FROM kcov AS cleanup

RUN <<eof
  sudo apt-get clean
  sudo rm -rf /var/lib/apt/lists/*
eof
