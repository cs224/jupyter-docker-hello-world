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

echo ">> Installing scs"
# conda install -c conda-forge scs
mamba install -c conda-forge scs

echo ">> Installing libgit2 and pystan from conda-forge"
mamba install -n py38ds -c conda-forge libgit2 pystan jupyter_nbextensions_configurator pyjanitor
# conda install -y -n py38ds -c conda-forge libgit2 pystan r-biocmanager

echo ">> Installing Google or-tools from conda-forge"
mamba install -n py38ds -c conda-forge  ortools-cpp ortools-python

echo ">> Installing pip installable packages"
pip install -r requirements.txt

# echo ">> Installing pymc3"
# mamba repoquery depends aesara -c conda-forge -t
# mamba install -y -n py38ds -c conda-forge aesara -vv
# -v or -vv to add verbosity as long as your version of conda is up-to-date. Older versions, you'll have to use --debug
# conda install -y -n py38ds -c conda-forge aesara
# pip install git+https://github.com/pymc-devs/pymc3
# conda install -y -n py38ds -c conda-forge pymc3=3.11.2
# pip install pymc3


echo ">> Installing additional R packages"
mamba install -n py38ds -c conda-forge r-biocmanager
# echo "r <- getOption('repos'); r['CRAN'] <- 'https://cloud.r-project.org'; options(repos = r);" > ~/.Rprofile
Rscript install-1.R

echo ">> Installing additional R package LexisPlotR"
# you have to run it twice to fix an install issue
Rscript install-2.R
Rscript install-2.R

echo ">> Installing pgmpy"
# mamba install -y -n py38ds -c ankurankan pgmpy
# conda install -y -n py38ds -c ankurankan pgmpy

echo ">> Installing libpgm"
# pip --no-cache-dir install git+https://github.com/CyberPoint/libpgm@master
# pip uninstall numpy
# pip install numpy==1.19.2
# pip install daal==2021.1.2
# pip install dpcpp_cpp_rt==2021.1.2

#conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
# mamba install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch -c nvidia

conda info --envs
# conda list
