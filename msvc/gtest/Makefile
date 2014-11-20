srcdir=..\..\tensor
includedir=..\include\tensor
top_builddir=..

CXX=cl
CPPFLAGS=/I. /I..\include
CXXFLAGS=/O2 /nologo /EHsc

TARGETS=..\include\gtest\gtest.h ..\lib\gtest.lib
objects=gtest-all.obj gtest_main.obj

.SUFFIXES: .cc .f

.cc.obj:
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /c /Fo$@ $<

all: $(TARGETS)

..\lib\gtest.lib: $(objects)
	lib /out:$@ $(objects)

..\include\gtest\gtest.h: gtest.h
	-md ..\include\gtest
	copy gtest.h $@

clean:
	-for %f in ($(objects) $(TARGETS)) do if exist %f del %f
	-if exist ..\include\gtest rd /s /q  ..\include\gtest
