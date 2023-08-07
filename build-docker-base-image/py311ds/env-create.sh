#!/usr/bin/env bash

# exit when any command fails
set -e

# https://kapeli.com/cheat_sheets/Conda.docset/Contents/Resources/Documents/index

# conda config --show | less
# conda config --describe | less
# conda config --write-default

# https://github.com/mamba-org/mamba
# conda update --all
# conda update -y -n base -c defaults conda --no-pin
# conda update -y conda --no-pin
# ---
# conda install mamba -n base -c conda-forge

echo ">> Updating base environemnt"
# https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html : Do not use pip with the --user argument, avoid all users installs.
pip install --upgrade pip # --user

echo ">> Setting-up py311ds environemnt"
# conda create -n py311ds python=3.11
mamba env create -f environment.yml
#conda env create -f environment.yml

echo ">> Activating py311ds environment"
CONDA_BASE=$(conda info --base)
source ${CONDA_BASE}/etc/profile.d/conda.sh
conda activate py311ds

echo ">> Installing scs from conda-forge"
mamba install -c conda-forge scs

echo ">> Installing libgit2 jupyter_nbextensions_configurator pyjanitor from conda-forge"
mamba install -n py311ds -c conda-forge libgit2 jupyter_nbextensions_configurator pyjanitor

# echo ">> Installing Google or-tools from conda-forge"
# mamba install -n py311ds -c conda-forge  ortools-cpp ortools-python # requires python 3.10

echo ">> Installing PyMC from conda-forge"
mamba install -n py311ds -c conda-forge "pymc>=5"

echo ">> Installing pip installable packages"
pip install -r requirements.txt

echo ">> Installing additional R packages"
mamba install -n py311ds -c conda-forge r-biocmanager
# echo "r <- getOption('repos'); r['CRAN'] <- 'https://cloud.r-project.org'; options(repos = r);" > ~/.Rprofile
Rscript install-1.R

echo ">> Installing additional R package LexisPlotR"
# you have to run it twice to fix an install issue
Rscript install-2.R
Rscript install-2.R

conda info --envs
