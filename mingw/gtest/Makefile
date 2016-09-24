msvcgtest=../../msvc/gtest

include ../Makefile.flags

CPPFLAGS=-I. -I../include -I$(msvcgtest)

TARGETS=../include/gtest/gtest.h ../lib/libgtest.a
objects=gtest-all.obj gtest_main.obj

.SUFFIXES: .cc .f

%.obj: $(msvcgtest)/%.cc
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<

all: $(TARGETS)

../lib/libgtest.a: $(objects)
	$(AR) r $@ $(objects)

../include/gtest/gtest.h: $(msvcgtest)/gtest.h
	-md ..\include\gtest
	copy $(subst /,\,$< $@)

clean:
	-for %%f in $(subst /,\,($(objects) $(TARGETS))) do if exist %%f del %%f
	-if exist ..\include\gtest rd \s \q  ..\include\gtest
