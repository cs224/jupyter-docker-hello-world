FROM jupyter/datascience-notebook:c88678a1c7c9

LABEL maintainer="Christian Schuhegger <christian.schuhegger@gmx.de>"

USER $NB_UID

COPY environment.yml $HOME/

RUN pip install --upgrade pip

RUN conda install -c conda-forge watermark=1.6.0
RUN pip --no-cache-dir install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.6.0-cp36-cp36m-linux_x86_64.whl

# RUN conda install -c pyviz pyviz=0.9.7
RUN conda install -c pyviz holoviews=1.9.5
RUN conda env update -n root
# RUN conda install -c astropy astroml=0.3
RUN conda install -c conda-forge pystan=2.17.1.0 pymc3=3.4.1 qgrid=1.0.2

# https://uoftcoders.github.io/studyGroup/lessons/r-python-conda-setup/
# https://github.com/conda-forge/r-essentials-feedstock
RUN conda install -c r r-essentials=3.4.3 rpy2=2.9.1 r-rstan=2.17.2 r-tidyverse=1.2.1 r-lubridate=1.7.1 r-networkd3=0.4
# only conda-forge r-bnlearn=4.3

# RUN conda install -c bioconda bioconductor-graph bioconductor-rbgl

COPY install.R $HOME/
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'https://cloud.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript install.R

COPY install-r-packages.py $HOME/
RUN python3 $HOME/install-r-packages.py

# https://stackoverflow.com/questions/39365080/pip-install-editable-with-a-vcs-url
# https://stackoverflow.com/questions/20101834/pip-install-from-git-repo-branch
RUN pip --no-cache-dir install git+https://github.com/GPflow/GPflow.git@16570be787f2d3b0d8c4469a54ea2c6279186d8f
RUN pip --no-cache-dir install git+https://github.com/astroML/astroML.git@master
RUN pip --no-cache-dir install git+https://github.com/jszymon/pacal.git@master
