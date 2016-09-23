srcdir=../../cblapack

include ../Makefile.flags
include ../../cblapack/blas.inc
include ../../cblapack/cblas.inc
include ../../cblapack/lapack.inc

blas_pre=$(subst .c,.obj,$(BLAS))
cblas_pre=$(subst .c,.obj,$(CBLAS))
lapack_pre=$(subst .c,.obj,$(LAPACK))

blas_objs=$(subst src/,,$(blas_pre))
cblas_objs=$(subst src/,,$(cblas_pre))
lapack_objs=$(subst src/,,$(lapack_pre))

headers=../include/cblapack.h\
	../include/cblapack/blas.h \
	../include/cblapack/cblas.h \
	../include/cblapack/clapack.h

TARGETS=../lib/libblas.a ../lib/libcblas.a ../lib/liblapack.a $(headers)

CPPFLAGS=-I. -I../include -I$(srcdir)/include

.SUFFIXES: .c .obj

cblas/%.obj: $(srcdir)/src/cblas/%.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
blas/%.obj: $(srcdir)/src/blas/%.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
lapack/%.obj: $(srcdir)/src/lapack/%.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<

all: $(TARGETS)

../lib/libblas.a: $(blas_objs)
	-if exist $@ del $@
	$(AR) r $@ $(blas_objs)
../lib/libcblas.a: $(cblas_objs)
	-if exist $@ del $@
	$(AR) r $@ $(cblas_objs)
../lib/liblapack.a: $(lapack_objs)
	-if exist $@ del $@
	$(AR) r $@ $(lapack_objs)

$(headers):
	-md ..\include\cblapack
	copy ..\..\cblapack\blas\include\cblapack.h ..\include
	copy ..\..\cblapack\blas\include\cblapack\blas.h ..\include\cblapack
	copy ..\..\cblapack\blas\include\cblapack\lapack.h ..\include\cblapack
	copy ..\..\cblapack\blas\include\cblapack\cblas.h ..\include\cblapack

clean:
	-for %f in (blas\*.obj cblas\*.obj lapack\*.obj) do if exist %f del %f
	-for %f in (..\lib\libblas.a ..\lib\libcblas.a ..\lib\liblapack.a ..\include\cblapack.h ..\include\cblapack\*.h) do if exist %f del %f
	-rd ..\include\cblapack
	-del *.pdb
