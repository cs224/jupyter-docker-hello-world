#!/bin/bash

dir=`readlink -f $0`
dir=`dirname $dir`

IMAGE=jupyter-docker-base-image:201804191153

#docker run -it --rm -v ${dir}:/home/jovyan/work --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') $IMAGE start.sh
echo docker run -it --rm -v ${dir}:/home/jovyan/work -p 8888:8888 --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') -w /home/jovyan/work $IMAGE start-notebook.sh --NotebookApp.token=''

docker run -it --rm -v ${dir}:/home/jovyan/work -p 8888:8888 --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') -w /home/jovyan/work $IMAGE start-notebook.sh --NotebookApp.token=''

