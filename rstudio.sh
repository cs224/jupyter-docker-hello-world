#!/bin/bash

# https://medium.com/@pigiuz/hw-accelerated-gui-apps-on-docker-7fd424fe813e
# https://github.com/NVIDIA/nvidia-docker
# apt-get install mesa-utils
# glxgears

# https://anaconda.org/r/rstudio

dir=`pwd`

#IMAGE=jupyter-docker-base-image:201804191153
IMAGE=jupyter-docker-base-image:201805011526

docker run -it --rm --net=host --runtime=nvidia -v ${dir}:/home/jovyan/work -v $HOME/.Xauthority:/home/jovyan/.Xauthority --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') -e DISPLAY=$DISPLAY -w /home/jovyan/work $IMAGE /bin/bash

