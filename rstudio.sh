#!/bin/bash

# https://medium.com/@pigiuz/hw-accelerated-gui-apps-on-docker-7fd424fe813e
# https://github.com/NVIDIA/nvidia-docker
# apt-get install mesa-utils
# glxgears

# https://anaconda.org/r/rstudio

dir=`pwd`

TAG_DATE=201804191153
#IMAGE=jupyter-docker-base-image:$TAG_DATE
IMAGE=rstudio-docker-base-image:$TAG_DATE

# docker run --rm -it --net=host --privileged --env="DISPLAY" -v $HOME/.Xauthority:/root/.Xauthority --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="/usr/lib/x86_64-linux-gnu/libXv.so.1:/usr/lib/x86_64-linux-gnu/libXv.so.1" -v ${dir}:/home/jovyan/work --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') -e HTTP_PROXY=${HTTP_PROXY} -e HTTPS_PROXY=${HTTPS_PROXY} -e http_proxy=${HTTP_PROXY} -e https_proxy=${HTTPS_PROXY} -w /home/jovyan/work ubuntu:latest sh -c 'apt-get update && apt-get install -qqy x11-apps && xeyes'

docker run --rm -t --net=host --privileged --env="DISPLAY" -v $HOME/.Xauthority:/home/jovyan/.Xauthority --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="/usr/lib/x86_64-linux-gnu/libXv.so.1:/usr/lib/x86_64-linux-gnu/libXv.so.1" -v ${dir}:/home/jovyan/work --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') -e HTTP_PROXY=${HTTP_PROXY} -e HTTPS_PROXY=${HTTPS_PROXY} -e http_proxy=${HTTP_PROXY} -e https_proxy=${HTTPS_PROXY} -w /home/jovyan/work $IMAGE rstudio
