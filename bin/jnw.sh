#!/bin/bash

dir=`readlink -f $1`
bn=`basename $dir`
dn=`dirname $dir`

# echo $dir
# echo $bn
# echo $dn

if [[ -d $dir ]]; then
    echo ""
elif [[ -f $dir ]]; then
    echo "$dir is not a directory"
    exit 1
else
    echo "$dir is not valid"
    exit 1
fi

# https://hub.docker.com/r/conda/

# https://hub.docker.com/u/continuumio/
# https://github.com/ContinuumIO/docker-images

# https://hub.docker.com/u/jupyter/
# https://github.com/jupyter/docker-stacks

#docker run -it --rm -v $(readlink -f ./20180328-docker-tmp):/tmp/t1 -u $UID:$(getent group docker | awk -F: '{printf "%d", $3}') -w /tmp/t1 alpine:3.7 /bin/sh
#docker run -it --rm -p 8888:8888 -v ${dir}:/tmp/${bn} -u $UID:$(getent group docker | awk -F: '{printf "%d", $3}') -w /tmp/${bn} continuumio/anaconda3:5.1.0 HOME=`readlink -f .` && jupyter notebook --port 8888 --no-browser
#docker run -it --rm -p 8888:8888 -v ${dir}:/tmp/${bn} -w /tmp/${bn} continuumio/anaconda3:5.1.0 'HOME=/tmp/${bn} && jupyter notebook --port 8888 --no-browser'
#docker run -it --rm -p 8888:8888 -v ${dir}:/tmp/${bn} -w /tmp/${bn} continuumio/anaconda3:5.1.0 /bin/bash
#docker run -it --rm -p 8888:8888 continuumio/anaconda3:5.1.0 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"

#IMAGE=jupyter/datascience-notebook:c88678a1c7c9
IMAGE=jupyter-binder-hello-world-image:latest

# https://conda.io/docs/user-guide/install/download.html
# MINICONDA_VERSION 4.3.30
#docker run -it --rm -v ${dir}:/home/jovyan/work --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') $IMAGE start.sh
docker run -it --rm -v ${dir}:/home/jovyan/work -p 8888:8888 --user root -e NB_UID=$UID -e NB_GID=$(getent group docker | awk -F: '{printf "%d", $3}') -w /home/jovyan/work $IMAGE start-notebook.sh --NotebookApp.token=''

