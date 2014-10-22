srcdir=..\..\mps
includedir=..\include\mps

CXX=cl
LINK=lib
CPPFLAGS=/I. /I..\include

include ..\Makefile.flags
include ..\..\mps\src\Makefile.am
include ..\..\mps\include\Makefile.am

mps_headers=$(nobase_include_HEADERS:mps/=$(includedir)\) \
	$(includedir)\config.h
mps_orig_headers=$(nobase_include_HEADERS:mps/=..\include\mps\)
mps_objects=$(libmps_la_SOURCES:.cc=.obj)
mps_objects=$(mps_objects:/=\)
directories=iTEBD quantum hamiltonian tools evolve dmrg mps mpo

TARGETS=..\lib\mps.lib

.SUFFIXES: .cc .obj

all: $(TARGETS)

$(mps_objects): ..\include\mps\config.h $(mps_orig_headers)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /c /Fo$@ $(srcdir)/src/$(@:.obj=.cc)

$(mps_headers): $(srcdir)\include\mps
	-md ..\include\mps
	-md $(directories)
	xcopy /y /s $(srcdir)\include\mps ..\include\mps
	copy config.h $(includedir)

..\lib\mps.lib: $(mps_objects)
	$(LINK) -lib /out:$@ $(mps_objects)

clean:
	-for %f in ($(TARGETS)) do if exist %f del %f
	-for %f in ($(directories) $(includedir)) do if exist %f rd /s /q %f
	-del test\*.exe test\*.obj
	-del *.pdb

############################################################
# TEST WITH GOOGLE TESTS
#

test_objs = test\test_main.obj test\random_unitary_d.obj	\
	test\random_unitary_z.obj test\random_permutation.obj	\
	test\hamilt_test.obj test\random_product_RMPS.obj	\
	test\random_product_CMPS.obj
all_test_programs = test\test_quantum_spin.exe				\
	test\test_quantum_fock.exe test\test_mps_mps.exe		\
	test\test_mps_norm.exe test\test_mps_correlation.exe		\
	test\test_mps_canonical.exe test\test_mps_simplify.exe		\
	test\test_mps_simplify_many.exe					\
	test\test_mps_simplify_many2.exe test\test_mpo_base.exe		\
	test\test_itebd_base.exe test\test_itebd_expected.exe		\
	test\test_itebd_expected_slow.exe test\test_mps_lform.exe	\
	test\test_mps_simplify_obc.exe test\test_mps_solve.exe		\
	test\test_time_solver_trotter2.exe				\
	test\test_time_solver_trotter3.exe				\
	test\test_time_solver_arnoldi.exe test\test_itebd_itime.exe	\
	test\test_dmrg.exe

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
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /I$(srcdir)/src			\
		/I$(srcdir)\test /Fo$(@:.exe=.obj) /Fe$@ $<		\
		test/test_main.obj test/test.lib ..\lib\mps.lib		\
		..\lib\tensor.lib ..\lib\lapack.lib ..\lib\blas.lib	\
		..\lib\cblas.lib ..\lib\f2c.lib ..\lib\gtest.lib	\
		advapi32.lib
test/test_dmrg.exe: $(srcdir)/test/test_dmrg.cc
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /I$(srcdir)/src			\
		/I$(srcdir)\test /Fe$@ $(srcdir)/test/test_dmrg.cc	\
		test/test.lib ..\lib\mps.lib ..\lib\tensor.lib		\
		..\lib\lapack.lib ..\lib\blas.lib ..\lib\cblas.lib	\
		..\lib\f2c.lib ..\lib\gtest.lib advapi32.lib

test/test.lib: $(test_objs) all
	lib /out:$@ $(test_objs)

