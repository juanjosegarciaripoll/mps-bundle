srcdir=../../tensor
includedir=../include/tensor
top_builddir=..

CPPFLAGS=-I	. -I../include

include ../Makefile.flags
include ../../tensor/include/Makefile.am
include ../../tensor/src/Makefile.inc

headers= $(subst tensor/,$(includedir)/,$(nobase_include_HEADERS))
orig_headers= $(subst tensor/,$(srcdir)/include/tensor/,$(nobase_include_HEADERS))
tensor_objs= $(subst .cc,.obj,$(basic_SOURCES) $(rand32_SOURCES) $(arpack_f2c_SOURCES))
arpack_objs = $(subst .c,.obj,$(arpack_precompiled_SOURCES))
directories= arpack compare fftw generated indices linalg \
	rand sdf sparse tensor tools views arpack-ng arpack-f2c tests profile

TARGETS=../lib/libtensor.a

.SUFFIXES: .cc .obj .log

all: $(TARGETS)

$(tensor_objs): ../include/tensor/config.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $(srcdir)/src/$(subst .obj,.cc,$@)

$(arpack_objs):
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $(srcdir)/src/$(subst .obj,.c,$@)

$(headers) $(includedir)/config.h: $(srcdir)\include/tensor
	-md ..\include\tensor
	-md $(directories)
	xcopy /y /s $(subst /,\,$(srcdir)/include/tensor ../include/tensor)
	copy config.h ..\include\tensor

../lib/libtensor.a: $(tensor_objs) $(arpack_objs)
	$(AR) r $@ $(tensor_objs) $(arpack_objs)

############################################################
# TEST WITH GOOGLE TESTS
#

test_objs = test/test_main.obj test/alloc_informer.obj	\
	test/random_unitary_d.obj test/random_unitary_z.obj \
	test/random_permutation.obj
all_test_programs = test/test_refcount.exe \
	test/test_index.exe test/test_booleans.exe test/test_rand.exe \
	test/test_tensor_base.exe test/test_tensor_getset.exe \
	test/test_tensor_unop.exe test/test_tensor_binop.exe \
	test/test_tensor_binop_error.exe test/test_tensor_comparison.exe \
	test/test_tensor_kron.exe test/test_tensor_scale.exe \
	test/test_tensor_permute.exe test/test_tensor_trace.exe \
	test/test_view_read.exe test/test_view_set.exe test/test_view_errors.exe \
	test/test_matrix.exe test/test_sparse_base.exe test/test_sparse_ops.exe \
	test/test_sparse_ops.exe test/test_sparse_kron.exe test/test_sparse_indices.exe \
	test/test_mmult.exe test/test_fold.exe test/test_linalg_svd.exe \
	test/test_linalg_eig.exe test/test_linalg_eig_sym.exe \
	test/test_linalg_eig_power.exe test/test_linalg_expm.exe\
	test/test_sdf.exe test/test_tensor_take_diag.exe test/test_linalg_eigs.exe

FAILING_TESTS=test/test_jobs.exe 

check: ../lib/libgtest.a test/libtest.a $(all_test_programs)
	for %%f in ($(subst /,\,$(all_test_programs))) do %%f

../lib/libgtest.a:
	$(MAKE) -C ../gtest DEBUG=$(DEBUG)

test/%.obj: $(srcdir)/test/%.cc
	-if not exist test md test
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<
test/%.exe: $(srcdir)/test/%.cc
	$(CXX) $(CPPFLAGS) -I$(srcdir)/src -I$(srcdir)/test -o $@ $< \
		test/test_main.obj -Ltest -ltest -L../lib \
		-ltensor -llapack -lcblas -lblas -lf2c \
		-lgtest -ladvapi32 -lstdc++

test/libtest.a: $(test_objs) all
	$(AR) r $@ $(test_objs)

