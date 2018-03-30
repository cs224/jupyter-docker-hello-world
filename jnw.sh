#!/bin/bash

dir=`readlink -f $0`
dir=`dirname $dir`

IMAGE=$DATA_SCIENCE_PROJECT:latest

#docker run -it --rm -v ${dir}:/home/jovyan/work --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') $IMAGE start.sh
docker run -it --rm -v ${dir}:/home/jovyan/work -p 8888:8888 --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') -w /home/jovyan/work $IMAGE start-notebook.sh --NotebookApp.token=''

