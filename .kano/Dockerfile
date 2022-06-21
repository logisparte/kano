# syntax=docker/dockerfile:1
FROM ghcr.io/logisparte/helot-22.04:4.2.1 AS base

LABEL org.opencontainers.image.title="kano-dev"
LABEL org.opencontainers.image.description="kano's development image"
LABEL org.opencontainers.image.authors="@logisparte"
LABEL org.opencontainers.image.source="https://github.com/logisparte/kano"

RUN apt-get update

FROM base AS markdownlint_prettier

RUN <<eof
  curl --silent --show-error --location https://deb.nodesource.com/setup_lts.x \
    | bash -
  DEBIAN_FRONTEND=noninteractive apt-get install --yes --quiet --no-install-recommends \
    nodejs
  npm config set update-notifier=false fund=false
  npm install --location=global --no-optional \
    markdownlint-cli@0.31.1 \
    prettier@2.7.1
  npm cache clean --force
eof

FROM markdownlint_prettier AS shfmt

ARG TARGETARCH

ENV PATH="$PATH:/usr/local/go/bin:/root/go/bin"

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
      | tar --directory /usr/local --extract --gzip
  go install mvdan.cc/sh/v3/cmd/shfmt@v3.5.1
  go clean --cache
eof

FROM shfmt AS shellcheck

RUN <<eof
  DEBIAN_FRONTEND=noninteractive apt-get install --yes --quiet --no-install-recommends \
    shellcheck
eof

FROM shellcheck AS shellspec

ENV PATH="$PATH:/root/.local/bin"

RUN <<eof
  curl --silent --show-error --location https://git.io/shellspec \
    | sh -s 0.28.1 --yes
eof

FROM base AS kcov_builder

RUN <<eof
  KCOV_VERSION="40"
  KCOV_DIRECTORY="kcov-$KCOV_VERSION"
  DEBIAN_FRONTEND=noninteractive apt-get install --yes --quiet --no-install-recommends \
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
      | tar --extract --gzip
  cmake -B "$KCOV_DIRECTORY/build" -Wno-dev "$KCOV_DIRECTORY"
  cmake --build "$KCOV_DIRECTORY/build" --target install
eof

FROM shellspec AS kcov

COPY --from=kcov_builder /usr/local/bin/kcov* /usr/local/bin/
COPY --from=kcov_builder /usr/local/share/doc/kcov /usr/local/share/doc/kcov

RUN <<eof
  DEBIAN_FRONTEND=noninteractive apt-get install --yes --quiet --no-install-recommends \
    binutils \
    libcurl4 \
    libdw1 \
    zlib1g
eof

FROM kcov AS cleanup

RUN <<eof
  apt-get clean
  rm -rf /var/lib/apt/lists/*
eof
