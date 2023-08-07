
I use the `git bash` shell for windows: https://gitforwindows.org/

For windows you have to:

* install `visual studio 2015-2019 x86` from here: https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads
* run `conda install m2w64-toolchain`
* run `conda install -c anaconda libpython`
* comment out in the `environment.yml`: bioconda::pycluster
  * no idea why this package is available for linux but not for windows?

For windows it may be sufficient to run the `env-create.sh` script only until `>> Activating py36ds environment`.
