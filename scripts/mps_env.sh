case `hostname -f` in
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
	if [ "x$1" = "xtensor" ]; then
	    . /opt/intel/mkl/10.0.5.025/tools/environment/mklvars64.sh
	    . /opt/intel/bin/compilervars.sh intel64
	    export CC=icc
	    export CXX=icpc
	    export CFLAGS="$CFLAGS -xHost -fomit-frame-pointer -freg-struct-return -finline-functions"
	    export CXXFLAGS="$CXXFLAGS -xHost -fno-exceptions -fomit-frame-pointer -freg-struct-return -finline-functions"
	fi
	;;
    *)
	if [ "x$1" = "xtensor" ]; then
	    if [ -f /opt/intel/mkl/bin/mklvars.sh ]; then
		. /opt/intel/mkl/bin/mklvars.sh intel64
	    fi
	    if [ -f /opt/intel/bin/compilervars.sh ]; then
		. /opt/intel/bin/compilervars.sh intel64
	    fi
	    if which icc > /dev/null; then
		export CC=icc
		export CXX=icpc
		export CFLAGS="$CFLAGS -xHost -fomit-frame-pointer -freg-struct-return -finline-functions"
		export CXXFLAGS="$CXXFLAGS -xHost -fno-exceptions -fomit-frame-pointer -freg-struct-return -finline-functions"
	    fi
	fi
esac

