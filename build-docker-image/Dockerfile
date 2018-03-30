FROM jupyter-docker-base-image:201803301245

LABEL maintainer="Christian Schuhegger <christian.schuhegger@gmx.de>"

USER $NB_UID

COPY environment.yml $HOME/

RUN conda env update -n root
