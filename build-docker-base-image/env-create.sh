#!/usr/bin/env bash

# exit when any command fails
set -e

# https://kapeli.com/cheat_sheets/Conda.docset/Contents/Resources/Documents/index

# conda config --show | less
# conda config --describe | less
# conda config --write-default

# https://github.com/conda/conda/issues/9367 Solving environment: failed with initial frozen solve. Retrying with flexible solve.
# conda config --set allow_conda_downgrades true
# conda install conda=4.6.14
# echo ">> Initial config settings"
# conda install -y pycryptosat
# conda config --set sat_solver pycryptosat
# # conda config --set channel_priority false
# conda config --set channel_priority strict

echo ">> Updating base environemnt"
# conda update -y -n base -c defaults conda --no-pin
# conda update -y conda --no-pin
# https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html : Do not use pip with the --user argument, avoid all users installs.
pip install --upgrade pip # --user

echo ">> Setting-up py36ds environemnt"
# conda create -n py36ds python=3.6
conda env create -f environment.yml

echo ">> Activating py36ds environment"
CONDA_BASE=$(conda info --base)
source ${CONDA_BASE}/etc/profile.d/conda.sh
conda activate py36ds

echo ">> Installing libgit2 and pystan from conda-forge"
conda install -y -n py36ds -c conda-forge libgit2 pystan r-biocmanager

echo ">> Installing additional R packages"
# echo "r <- getOption('repos'); r['CRAN'] <- 'https://cloud.r-project.org'; options(repos = r);" > ~/.Rprofile
Rscript install-1.R

echo ">> Installing additional R package LexisPlotR"
# you have to run it twice to fix an install issue
Rscript install-2.R
Rscript install-2.R

echo ">> Installing pgmpy"
conda install -y -n py36ds -c ankurankan pgmpy

echo ">> Installing libpgm"
pip --no-cache-dir install git+https://github.com/CyberPoint/libpgm@master

conda info --envs
# conda list
