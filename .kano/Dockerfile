# syntax=docker/dockerfile:1
FROM ghcr.io/logisparte/helot-22.04:6.0.0 AS base

LABEL org.opencontainers.image.title="kano-dev"
LABEL org.opencontainers.image.description="kano's development image"
LABEL org.opencontainers.image.authors="@logisparte"
LABEL org.opencontainers.image.source="https://github.com/logisparte/kano"

FROM base AS markdownlint_prettier_commitlint

RUN <<EOF
  curl --silent --show-error --location https://deb.nodesource.com/setup_lts.x \
    | sudo bash -
  DEBIAN_FRONTEND=noninteractive \
  sudo apt-get update \
  && sudo apt-get install --yes --quiet --no-install-recommends \
    nodejs
  sudo npm config set update-notifier=false fund=false
  sudo npm install --location=global --omit=dev --omit=optional \
    markdownlint-cli@0.31.1 \
    prettier@2.7.1 \
    @commitlint/cli@17.0.3
  sudo npm cache clean --force
EOF

FROM markdownlint_prettier_commitlint AS shfmt

ARG TARGETARCH

ENV GOBIN="/usr/bin"
ENV GOPATH="/usr/lib/go"
ENV GOPROXY="direct"

RUN <<EOF
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
EOF

FROM shfmt AS shellcheck

RUN <<EOF
  DEBIAN_FRONTEND=noninteractive \
  sudo apt-get update \
  && sudo apt-get install --yes --quiet --no-install-recommends \
    shellcheck
EOF

FROM shellcheck AS shellspec

RUN <<EOF
  curl --silent --show-error --location https://git.io/shellspec \
    | sudo sh -s 0.28.1 --dir /opt/shellspec --bin /usr/bin --yes
EOF

FROM base AS kcov_builder

RUN <<EOF
  KCOV_VERSION="40"
  KCOV_DIRECTORY="kcov-$KCOV_VERSION"
  KCOV_BUILD_DIRECTORY="$KCOV_DIRECTORY/build"
  DEBIAN_FRONTEND=noninteractive \
  sudo apt-get update \
  && sudo apt-get install --yes --quiet --no-install-recommends \
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
EOF

FROM shellspec AS kcov

COPY --from=kcov_builder /usr/local/bin/kcov* /usr/bin/

RUN <<EOF
  DEBIAN_FRONTEND=noninteractive \
  sudo apt-get update \
  && sudo apt-get install --yes --quiet --no-install-recommends \
    binutils \
    libcurl4 \
    libdw1 \
    zlib1g
EOF

FROM kcov AS cleanup

RUN <<EOF
  sudo apt-get clean
  sudo rm -rf /var/lib/apt/lists/*
EOF
