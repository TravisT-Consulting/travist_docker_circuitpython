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
    gettext

run pip3 install \
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

# Added gettext and python dependancies for CirciutPython

WORKDIR /build

# Circuitpython
RUN git clone --recurse-submodules https://github.com/adafruit/circuitpython.git
RUN git -C circuitpython checkout 7.3.0-beta.1
RUN make -C circuitpython/mpy-cross/
RUN make -C circuitpython/ports/unix/

# Bootloader
RUN git clone https://github.com/adafruit/uf2-samdx1.git
RUN git -C uf2-samdx1 checkout v3.14.0
