#!/usr/bin/env bash

conda create --name py38ds_ --clone py38ds
conda info --envs

# conda activate py38ds_
# cd .../aesara
# pip install -e .
# cd .../pymc3
# pip install -e .
#
# mamba install -c conda-forge cudatoolkit-dev
# mamba install -c conda-forge cudnn
# mamba remove tensorflow
# pip install --upgrade pip
# pip install --upgrade "jax[cuda111]"   -f https://storage.googleapis.com/jax-releases/jax_releases.html
# pip install --upgrade numpyro[cuda111] -f https://storage.googleapis.com/jax-releases/jax_releases.html
