#!/bin/bash

dir=`pwd`

source $HOME/.pycharm-docker-base-image.version.txt

docker run --rm -it --net=host --privileged --env="DISPLAY" -v $HOME/.Xauthority:/home/jovyan/.Xauthority --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="/usr/lib/x86_64-linux-gnu/libXv.so.1:/usr/lib/x86_64-linux-gnu/libXv.so.1" --volume="/usr/lib/x86_64-linux-gnu/libXtst.so.6:/usr/lib/x86_64-linux-gnu/libXtst.so.6" -v ${dir}:/home/jovyan/work --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') -e HTTP_PROXY=${HTTP_PROXY} -e HTTPS_PROXY=${HTTPS_PROXY} -e http_proxy=${HTTP_PROXY} -e https_proxy=${HTTPS_PROXY} -w /home/jovyan/work $IMAGE /bin/bash

# docker commit ###container-id### pycharm-docker-base-image{TAG_DATE}:YYYYMMDDHHMM
# write pycharm-docker-base-image{TAG_DATE}:YYYYMMDDHHMM as:
#   IMAGE=pycharm-docker-base-image-{TAG_DATE}:YYYYMMDDHHMM
# into the file ~/.pycharm-docker-base-image.version.txt
