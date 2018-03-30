# jupyter-docker-hello-world

Activate [npstripout](https://github.com/kynan/nbstripout) in your local repository to make sure that you do not commit huge notebooks to the repository:

    pip install --upgrade nbstripout
    nbstripout --install
    nbstripout --install --attributes .gitattributes

Build the docker images. All commands need the environment variables set in `env.sh`. Execute the following in each shell you work in:

    bash # so that you can leave the environment with Ctrl-D
    source env.sh

Build the docker images:

    pushd build-docker-base-image && make && popd
    pushd build-docker-image && make && popd

Run the docker image:

    ./jnw.sh # jupyter notebook wrapper

And connect with your browser to: `http://localhost:8888`

Test it locally outside of docker via a python/conda environment:

    conda env create # conda env create -n jupyter-docker-hello-world
    # conda env update
    # conda remove --name jupyter-docker-hello-world --all
    source activate jupyter-docker-hello-world
    source deactivate
    conda info --envs # or: conda env list
    conda list -n jupyter-docker-hello-world
    conda env export > environment_.yml

Pay attention to `.condarc` for the channels it contains:

    $ cat ~/.condarc
    channels:
      - pyviz
      - conda-forge
      - defaults

Check on the command line if a module is installed:

    python -c "import watermark"

See [notes-on-anaconda](http://vincebuffalo.org/notes/2017/08/28/notes-on-anaconda.html) for some pitfalls, especially around [not being able to specify channels on a per dependency level](https://github.com/conda/conda/issues/2800).
