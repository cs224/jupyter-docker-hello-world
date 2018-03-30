
dir=`readlink -f $0`
dn=`dirname $dir`
bn=`basename $dn`

export DATA_SCIENCE_PROJECT=$bn
