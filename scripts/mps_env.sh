#
# Local definitions take precedence
#
case `uname` in
    *BSD) THEHOST=`hostname`;;
    *) THEHOST=`hostname -f`;;
esac
case $THEHOST in
    master*csic.es) # trueno.iff.csic.es
	export CC=icc
	export CXX=icpc
	export CFLAGS="$CFLAGS -fomit-frame-pointer -finline-functions"
	export CXXFLAGS="$CXXFLAGS -fno-exceptions -fomit-frame-pointer -finline-functions"
	#export CFLAGS="$CFLAGS -xHost -fomit-frame-pointer -finline-functions"
	#export CXXFLAGS="$CXXFLAGS -xHost -fno-exceptions -fomit-frame-pointer -finline-functions"
	;;
    loginidp*mad) # XCeSViMa
	# Atlas library
	export PATH=`pwd`/../bin:$PATH
	export CC=icc
	export CXX=icpc
	export CFLAGS="$CFLAGS -xHost -fomit-frame-pointer -finline-functions"
	export CXXFLAGS="$CXXFLAGS -xHost -fno-exceptions -fomit-frame-pointer -finline-functions"
	;;
    login*mad) # CeSViMa
	# Atlas library
	export CPPFLAGS=-I/sw/openmpi/ATLAS/3.8.4-gnu64-4.3/include
	export LDFLAGS="-L/sw/openmpi/ATLAS/3.8.4-gnu64-4.3/lib"
	export LIBS="-llapack -lcblas -lf77blas -latlas -lgfortran"
	export CC=gcc-4.3
	export CXX=g++-4.3
	# ESSL library
	#export CC="xlc -q64"
	#export CXX="xlC -q64"
	;;
    master*csic.es) # trueno.iff.csic.es
	export CC=icc
	export CXX=icpc
	export CFLAGS="$CFLAGS -fomit-frame-pointer -finline-functions"
	export CXXFLAGS="$CXXFLAGS -fno-exceptions -fomit-frame-pointer -finline-functions"
	#export CFLAGS="$CFLAGS -xHost -fomit-frame-pointer -finline-functions"
	#export CXXFLAGS="$CXXFLAGS -xHost -fno-exceptions -fomit-frame-pointer -finline-functions"
	;;
    *)
	if [ -f /opt/intel/mkl/bin/mklvars.sh ]; then
	    . /opt/intel/mkl/bin/mklvars.sh intel64
	fi
	if [ -f /opt/intel/bin/compilervars.sh ]; then
	    . /opt/intel/bin/compilervars.sh intel64
	fi
	if which icc > /dev/null; then
	    export CC=icc
	    export CXX=icpc
	    #export CFLAGS="$CFLAGS -xHOST -fomit-frame-pointer -finline-functions"
	    #export CXXFLAGS="$CXXFLAGS -xHOST -fno-exceptions -fomit-frame-pointer -finline-functions"
	fi
esac
if test -f local_vars.sh; then
    . ./local_vars.sh
fi
if test -f scripts/local_vars.sh; then
    . ./scripts/local_vars.sh
fi
