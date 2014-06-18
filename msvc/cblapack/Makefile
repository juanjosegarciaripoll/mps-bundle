srcdir=../../cblapack

include ../../cblapack/blas.inc
include ../../cblapack/cblas.inc
include ../../cblapack/lapack.inc

blas_pre=$(BLAS:.c=.obj)
cblas_pre=$(CBLAS:.c=.obj)
lapack_pre=$(LAPACK:.c=.obj)

blas_objs=$(blas_pre:src/=)
cblas_objs=$(cblas_pre:src/=)
lapack_objs=$(lapack_pre:src/=)

headers=..\include\cblapack.h\
	..\include\cblapack\blas.h \
	..\include\cblapack\clapack.h

TARGETS=..\lib\blas.lib $(headers)

CC=cl
LINK=link


.SUFFIXES: .c .obj

{$(srcdir)/src/cblas}.c{cblas}.obj:
	$(CC) $(CFLAGS) /I. /I../include /I$(srcdir)/include /c /Fo$@ $<
{$(srcdir)/src/blas}.c{blas}.obj:
	$(CC) $(CFLAGS) /I. /I../include /I$(srcdir)/include /c /Fo$@ $<
{$(srcdir)/src/lapack}.c{lapack}.obj:
	$(CC) $(CFLAGS) /I. /I../include /I$(srcdir)/include /c /Fo$@ $<

all: $(TARGETS)

..\lib\blas.lib: $(blas_objs)
	-del $@
	$(LINK) -lib -out:$@ $(blas_objs)

$(headers):
	copy ..\..\cblapack\blas\$@ $@

clean:
	-del blas\*.obj
	-del cblas\*.obj
	-del lapack\*.obj
	-del $(TARGETS)
