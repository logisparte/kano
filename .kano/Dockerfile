# syntax=docker/dockerfile:1
FROM ghcr.io/logisparte/helot-22.04:7.0.0 AS base

LABEL org.opencontainers.image.title="kano-dev"
LABEL org.opencontainers.image.description="kano's development image"
LABEL org.opencontainers.image.authors="@logisparte"
LABEL org.opencontainers.image.source="https://github.com/logisparte/kano"

FROM base AS common_tools

RUN <<EOF
  curl --silent --fail --show-error --location https://deb.nodesource.com/setup_lts.x \
    | sudo -E bash -
  DEBIAN_FRONTEND=noninteractive \
  sudo apt-get update \
  && sudo apt-get install --yes --quiet --no-install-recommends \
    nodejs \
    shellcheck \
    shfmt
  sudo npm config set update-notifier=false fund=false
  sudo npm install --location=global --omit=dev --omit=optional \
    markdownlint-cli@0.33.0 \
    prettier@2.8.4 \
    @commitlint/cli@17.4.4
  sudo npm cache clean --force
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

FROM common_tools AS shellspec_kcov

COPY --from=kcov_builder /usr/local/bin/kcov* /usr/bin/

RUN <<EOF
  curl --silent --show-error --location https://git.io/shellspec \
    | sudo sh -s 0.28.1 --dir /opt/shellspec --bin /usr/bin --yes
  DEBIAN_FRONTEND=noninteractive \
  sudo apt-get update \
  && sudo apt-get install --yes --quiet --no-install-recommends \
    binutils \
    libcurl4 \
    libdw1 \
    zlib1g
EOF

FROM shellspec_kcov AS cleanup

RUN <<EOF
  sudo apt-get clean
  sudo rm -rf /var/lib/apt/lists/*
EOF
