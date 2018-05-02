#!/bin/bash

#dir=`readlink -f $0`
#dir=`dirname $dir`
dir=`pwd`

TAG_DATE=201804191153
IMAGE=jupyter-docker-base-image:$TAG_DATE

docker run -it --rm -v ${dir}:/home/jovyan/work --pid=host --net=host --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') -e HTTP_PROXY=${HTTP_PROXY} -e HTTPS_PROXY=${HTTPS_PROXY} -e http_proxy=${HTTP_PROXY} -e https_proxy=${HTTPS_PROXY} -w /home/jovyan/work $IMAGE start-notebook.sh --NotebookApp.token=''
docker run -it --rm -v ${dir}:/home/jovyan/work --pid=host --net=host --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') -e HTTP_PROXY=${HTTP_PROXY} -e HTTPS_PROXY=${HTTPS_PROXY} -e http_proxy=${HTTP_PROXY} -e https_proxy=${HTTPS_PROXY} -w /home/jovyan/work $IMAGE start-notebook.sh --NotebookApp.token=''


