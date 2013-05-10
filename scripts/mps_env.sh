case `hostname -f` in
    login*mad) # CeSViMa
	if [ "x$1" = "xtensor" ]; then
	# Atlas library
	    # export CPPFLAGS=-I/sw/openmpi/ATLAS/3.8.4-gnu64-4.3/include
	    # export LDFLAGS="-L/sw/openmpi/ATLAS/3.8.4-gnu64-4.3/lib"
	    # export LIBS="-llapack -lcblas -lf77blas -latlas -lgfortran"
	    # export CC=gcc-4.3
	    # export CXX=g++-4.3
	# ESSL library
	    export CC="xlc -q64"
	    export CXX="xlc -q64"
	fi
	;;
    master*csic.es) # trueno.iff.csic.es
	if [ "x$1" = "xtensor" ]; then
	    . /opt/intel/mkl/10.0.5.025/tools/environment/mklvars64.sh
	fi
	;;
    ita*csic.es) # trueno.iff.csic.es Itanium
	if [ "x$1" = "xtensor" ]; then
	    . /opt/intel/mkl/10.0.5.025/tools/environment/mklvarsem64t.sh
	fi
	;;
    *)
	if [ "x$1" = "xtensor" ]; then
	    if [ -f /opt/intel/mkl/bin/mklvars.sh ]; then
		. /opt/intel/mkl/bin/mklvars.sh intel64
		export LDFLAGS="-L/opt/intel/mkl/lib -Wl,-rpath,/opt/intel/mkl/lib"
	    fi
	fi
esac

