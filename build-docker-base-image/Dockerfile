FROM jupyter/datascience-notebook:c88678a1c7c9

LABEL maintainer="Christian Schuhegger <christian.schuhegger@gmx.de>"

USER $NB_UID

COPY environment.yml $HOME/

RUN conda env update -n root
