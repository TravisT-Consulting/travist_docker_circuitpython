FROM travistconsulting/travist_docker_mp_cp_base

# Avoid user input needed only during build
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /build

# Circuitpython
RUN git clone --recurse-submodules https://github.com/adafruit/circuitpython.git
RUN git -C circuitpython checkout 7.3.0-beta.1
RUN make -C circuitpython/mpy-cross/
RUN make -C circuitpython/ports/unix/

# Bootloader
RUN git clone https://github.com/adafruit/uf2-samdx1.git
RUN git -C uf2-samdx1 checkout v3.14.0
