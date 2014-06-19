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

TARGETS=..\lib\blas.lib ..\lib\cblas.lib ..\lib\lapack.lib $(headers)

CC=cl
LINK=link
CPPFLAGS=/I. /I../include /I$(srcdir)/include
CFLAGS=/O2 /nologo


.SUFFIXES: .c .obj

{$(srcdir)/src/cblas}.c{cblas}.obj:
	$(CC) $(CFLAGS) $(CPPFLAGS) /c /Fo$@ $<
{$(srcdir)/src/blas}.c{blas}.obj:
	$(CC) $(CFLAGS) $(CPPFLAGS) /c /Fo$@ $<
{$(srcdir)/src/lapack}.c{lapack}.obj:
	$(CC) $(CFLAGS) $(CPPFLAGS) /c /Fo$@ $<

all: $(TARGETS)

..\lib\blas.lib: $(blas_objs)
	-if exist $@ del $@
	$(LINK) -lib -out:$@ $(blas_objs)
..\lib\cblas.lib: $(cblas_objs)
	-if exist $@ del $@
	$(LINK) -lib -out:$@ $(cblas_objs)
..\lib\lapack.lib: $(lapack_objs)
	-if exist $@ del $@
	$(LINK) -lib -out:$@ $(lapack_objs)

$(headers):
	-md ..\include\cblapack
	copy ..\..\cblapack\blas\$@ $@

clean:
	-for %f in (blas\*.obj cblas\*.obj lapack\*.obj) do if exist %f del %f
	-for %f in ($(TARGETS)) do if exist %f del %f
	-rd ..\include\cblapack
