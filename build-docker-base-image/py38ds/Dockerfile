FROM jupyter/datascience-notebook:dc9744740e12

# https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html
# https://github.com/jupyter/docker-stacks
# https://hub.docker.com/r/jupyter/datascience-notebook/tags/

# docker run --rm -it jupyter/datascience-notebook:dc9744740e12 bash
# docker run --rm -it jupyter-docker-base-image:latest bash
# enable sudo within the stack:
# https://github.com/jupyter/docker-stacks/issues/408
# https://github.com/jupyter/docker-stacks/blob/master/datascience-notebook/README.md#docker-options
# docker run -it --user root --privileged -v $(pwd):/home/jovyan/work -e GRANT_SUDO=yes --name=jdsn jupyter/datascience-notebook:dc9744740e12 start.sh bash
# docker start -ia jdsn
LABEL maintainer="cs224 <cs224@weisser-zwerg.dev>"

USER root
RUN ln -s /bin/gzip /usr/bin/gzip
RUN ln -s /bin/tar /bin/gtar

USER $NB_UID

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'https://cloud.r-project.org'; options(repos = r);" > ~/.Rprofile

# RUN conda config --set allow_conda_downgrades true
# RUN conda install -y conda=4.6.14 --no-pin

RUN conda init bash

COPY env-create.sh $HOME/
COPY environment.yml $HOME/
COPY install-1.R $HOME/
COPY install-2.R $HOME/

RUN env-create.sh
