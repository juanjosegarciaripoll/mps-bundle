srcdir=..\..\tensor
includedir=..\include\tensor
top_builddir=..

CPPFLAGS=/I. /I..\include

include ..\Makefile.flags
include ..\..\tensor\include\Makefile.am
include ..\..\tensor\src\Makefile.inc

headers= $(nobase_include_HEADERS:tensor/=$(includedir))
orig_headers= $(nobase_include_HEADERS:tensor/=$(srcdir)/include/tensor/)
tensor_objs= $(basic_SOURCES:.cc=.obj) \
	$(rand32_SOURCES:.cc=.obj) \
	$(arpack_f2c_SOURCES:.cc=.obj)
arpack_objs = \
	$(arpack_precompiled_SOURCES:.c=.obj)
directories= arpack compare fftw generated indices linalg \
	rand sdf sparse tensor tools views arpack-ng arpack-f2c tests profile

TARGETS=..\lib\tensor.lib

.SUFFIXES: .cc .obj .f .log

all: $(TARGETS)

$(tensor_objs): ..\include\tensor\config.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /c /Fo$@ $(srcdir)/src/$(@:.obj=.cc)

$(arpack_objs):
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /c /Fo$@ $(srcdir)/src/$(@:.obj=.c)

$(headers) $(includedir)\config.h: $(srcdir)\include\tensor
	-md ..\include\tensor
	-md $(directories)
	xcopy /y /s $(srcdir)\include\tensor ..\include\tensor
	copy config.h $(includedir)

..\lib\tensor.lib: $(tensor_objs) $(arpack_objs)
	$(LINK) -lib /out:$@ $(tensor_objs) $(arpack_objs)

############################################################
# TEST WITH GOOGLE TESTS
#

test_objs = test\test_main.obj test\alloc_informer.obj	\
	test\random_unitary_d.obj test\random_unitary_z.obj \
	test\random_permutation.obj
all_test_programs = test\test_refcount.exe \
	test\test_index.exe test\test_booleans.exe test\test_rand.exe \
	test\test_tensor_base.exe test\test_tensor_getset.exe \
	test\test_tensor_unop.exe test\test_tensor_binop.exe \
	test\test_tensor_binop_error.exe test\test_tensor_comparison.exe \
	test\test_tensor_kron.exe test\test_tensor_scale.exe \
	test\test_tensor_permute.exe test\test_tensor_trace.exe \
	test\test_view_read.exe test\test_view_set.exe test\test_view_errors.exe \
	test\test_matrix.exe test\test_sparse_base.exe test\test_sparse_ops.exe \
	test\test_sparse_ops.exe test\test_sparse_kron.exe test\test_sparse_indices.exe \
	test\test_mmult.exe test\test_fold.exe test\test_linalg_svd.exe \
	test\test_linalg_eig.exe test\test_linalg_eig_sym.exe \
	test\test_linalg_eig_power.exe test\test_linalg_expm.exe test\test_jobs.exe \
	test\test_sdf.exe test\test_tensor_take_diag.exe test\test_linalg_eigs.exe

check: ..\lib\gtest.lib test\test.lib $(all_test_programs)
	for %f in ($(all_test_programs)) do %f

..\lib\gtest.lib:
	cd ..\gtest
	nmake DEBUG=$(DEBUG)
	cd tensor

{$(srcdir)/test}.cc{test}.obj:
	-if not exist test md test
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /c /Fo$@ $<
{$(srcdir)/test}.cc{test}.exe:
	$(CXX) $(CPPFLAGS) /I$(srcdir)/src /I$(srcdir)\test /Fo$(@:.exe=.obj) /Fe$@ $< \
		test/test_main.obj test/test.lib ..\lib\tensor.lib \
		..\lib\lapack.lib ..\lib\blas.lib ..\lib\cblas.lib ..\lib\f2c.lib \
		..\lib\gtest.lib advapi32.lib

test/test.lib: $(test_objs) all
	lib /out:$@ $(test_objs)

############################################################
# PROFILE
#

all_prof_programs = profilebin\prof_vector.exe

profile: $(all_prof_programs)
	for %f in ($(all_prof_programs)) do %f

{$(srcdir)\profile}.cc{profilebin}.exe:
	-if not exist profilebin md profilebin
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /I$(srcdir)\profile /Fe$@ /Foprofilebin\foo.obj $< ../lib/tensor.lib ../lib/lapack.lib ../lib/cblas.lib ../lib/blas.lib ../lib/f2c.lib
	del profilebin\foo.obj
profile.log: $(all_prof_programs) profilebin\mytee.exe
	-if exist $@ del $@
	for %f in ($(all_prof_programs)) do %f >> $@

clean:
	-for %f in ($(TARGETS)) do if exist %f del %f
	-for %f in ($(directories) $(includedir) test) do if exist %f rd /s /q %f
	-del *.pdb
