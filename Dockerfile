FROM ubuntu:20.04

# Avoid user input needed only during build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    gcc-arm-none-eabi \
    build-essential \
    libffi-dev \
    pkg-config \
    git \
    python3-pip \
    python3-dev \
    gettext \
    huffman \
    cascadetoml \
    jinja2 \
    typer==0.4.0 \
    sh \
    click==8.0.4 \
    cpp-coveralls \
    requests \
    requests-cache \
    polib \
    pyyaml \
    intelhex \
    pyelftools \
    adafruit-circuitpython-typing

# Added gettext and after were added for circuitpython

WORKDIR /build

RUN git clone --recurse-submodules https://github.com/adafruit/circuitpython.git
RUN git -C circuitpython checkout 7.3.0-beta.1
RUN make -C circuitpython/mpy-cross/
RUN make -C circuitpython/ports/unix/
