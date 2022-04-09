# travist_docker_circuitpython

Ubuntu 20.04 based image with Python3 and build tools needed for Circuitpython


# Debugging
docker build -t --progress plain .
# Steps

## Build and Tag
Build and
docker build -t travistconsulting/travist_docker_circuitpython:mp_vX

## Push
docker push travistconsulting/travist_docker_circuitpython:mp_vX