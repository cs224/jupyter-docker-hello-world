
import locale
locale.setlocale(locale.LC_ALL, 'C')

import rpy2, rpy2.rinterface, rpy2.robjects, rpy2.robjects.packages, rpy2.robjects.lib, rpy2.robjects.lib.grid, \
    rpy2.robjects.lib.ggplot2, rpy2.robjects.pandas2ri, rpy2.interactive.process_revents, \
    rpy2.interactive, rpy2.robjects.lib.grdevices
# rpy2.interactive.process_revents.start()
# rpy2.robjects.pandas2ri.activate()

# import R's "base" package
base = rpy2.robjects.packages.importr('base')
# import R's utility package
utils = rpy2.robjects.packages.importr('utils')
# select a mirror for R packages
utils.chooseCRANmirror(ind=1) # select the first mirror in the list

# R package names
packnames = ('psych', 'GPArotation', 'corrplot')

# R vector of strings

# Selectively install what needs to be install.
# We are fancy, just because we can.
names_to_install = [x for x in packnames if not rpy2.robjects.packages.isinstalled(x)]
if len(names_to_install) > 0:
    utils.install_packages(rpy2.robjects.StrVector(names_to_install))

grdevices   = rpy2.robjects.packages.importr('grDevices')
psych       = rpy2.robjects.packages.importr('psych')
gparotation = rpy2.robjects.packages.importr('GPArotation')
corrplot    = rpy2.robjects.packages.importr('corrplot')
