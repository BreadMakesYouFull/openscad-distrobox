ARG BASE_IMG=docker.io/debian:12.5-slim
FROM $BASE_IMG AS base

RUN apt-get update  && apt-get install --no-install-recommends -y \
    curl \
    git \
    python-is-python3 \
    python3 \
    python3-venv \
    sudo \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Clone openscad
WORKDIR /
RUN git clone https://github.com/openscad/openscad ; \
    cd openscad ; \
    git submodule update --init --recursive
WORKDIR /openscad

# Install dependencies
RUN ./scripts/uni-get-dependencies.sh
RUN ./scripts/check-dependencies.sh

# Build
RUN cmake -B build -DEXPERIMENTAL=1
RUN cmake --build build

# To rebuild if you change source, just re-run:
# ``cmake --build build``

# Install
RUN cmake --install build
