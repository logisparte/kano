# syntax=docker/dockerfile:1
FROM ubuntu:22.04 AS base

LABEL org.opencontainers.image.title="kano-dev"
LABEL org.opencontainers.image.description="kano's development image"
LABEL org.opencontainers.image.authors="@logisparte"
LABEL org.opencontainers.image.source="https://github.com/logisparte/kano"

FROM base AS docker

RUN <<EOF
  DEBIAN_FRONTEND=noninteractive \
    apt-get update \
      && apt-get install --yes --quiet --no-install-recommends \
        sudo
  useradd --groups sudo --no-create-home docker
  passwd --delete docker
  apt-get clean
  rm -rf /var/lib/apt/lists/*
EOF

USER docker

SHELL ["/bin/sh", "-e", "-c"]

CMD ["/bin/sh"]

FROM docker AS system

RUN <<EOF
  sudo ln -snf "/usr/share/zoneinfo/UTC" /etc/localtime
  sudo sh -c "echo UTC > /etc/timezone"
  DEBIAN_FRONTEND=noninteractive \
    sudo apt-get update \
      && sudo apt-get install --yes --quiet --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        git \
        gnupg2 \
        software-properties-common \
        ssh-client \
        tzdata \
        unzip \
        vim \
        wget \
        zsh
  sudo git config --system init.defaultbranch master
  sudo apt-get clean
  sudo rm -rf /var/lib/apt/lists/*
EOF

ENV EDITOR="/usr/bin/vim"

FROM system AS system_github

RUN <<EOF
  curl --silent --show-error --location \
    "https://cli.github.com/packages/githubcli-archive-keyring.gpg" \
      | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  DEBIAN_FRONTEND=noninteractive \
    sudo apt-get update \
      && sudo apt-get install --yes --quiet --no-install-recommends \
        gh
  sudo apt-get clean
  sudo rm -rf /var/lib/apt/lists/*
EOF

FROM system_github AS project

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
  sudo apt-get clean
  sudo rm -rf /var/lib/apt/lists/*
EOF

FROM system AS kcov_builder

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
  sudo apt-get clean
  sudo rm -rf /var/lib/apt/lists/*
EOF

FROM project AS project_shellspec_kcov

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
  sudo apt-get clean
  sudo rm -rf /var/lib/apt/lists/*
EOF
