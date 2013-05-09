
case `hostname -f` in
    login*mad) # CeSViMa
	export CPPFLAGS=-I/sw/openmpi/ATLAS/3.8.4-gnu64-4.3/include
	export LDFLAGS="-L/sw/openmpi/ATLAS/3.8.4-gnu64-4.3/lib"
	export LIBS="-llapack -lcblas -lf77blas -latlas -lgfortran"
	;;
    master*csic.es) # trueno.iff.csic.es
	. /opt/intel/mkl/10.0.5.025/tools/environment/mklvars64.sh
	;;
    ita*csic.es) # trueno.iff.csic.es Itanium
	. /opt/intel/mkl/10.0.5.025/tools/environment/mklvarsem64t.sh
	;;
    *)
	if [ -f /opt/intel/mkl/bin/mklvars.sh ]; then
	    . /opt/intel/mkl/bin/mklvars.sh intel64
	    export LDFLAGS="-L/opt/intel/mkl/lib -Wl,-rpath,/opt/intel/mkl/lib"
	fi
esac

