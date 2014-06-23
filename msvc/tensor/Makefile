srcdir=..\..\tensor
includedir=..\include\tensor
top_builddir=..

CXX=cl
LINK=link
CPPFLAGS=/I. /I..\include
CXXFLAGS=/O2 /nologo /EHsc



include ..\..\tensor\include\Makefile.am
include ..\..\tensor\src\Makefile.inc

headers= $(nobase_include_HEADERS:tensor/=$(includedir))
orig_headers= $(nobase_include_HEADERS:tensor/=$(srcdir)/include/tensor/)
tensor_objs= $(basic_SOURCES:.cc=.obj) \
	$(rand32_SOURCES:.cc=.obj)
arpack_aux= $(arpack_SOURCES:.f=.obj)
arpack_objs= $(arpack_aux:.cc=.obj)
directories= arpack compare fftw generated indices linalg \
	rand sdf sparse tensor tools views arpack-ng

TARGETS=..\lib\tensor.lib

.SUFFIXES: .cc .obj .f

{$(srcdir)/src/arpack-ng}.f{arpack-ng}.obj:
	..\bin\f2c.exe $< -o foo.c
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /c /Fo$@ foo.c
	del foo.c
{$(srcdir)/src/arpack}.cc{arpack}.obj:
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /c /Fo$@ $<

all: $(TARGETS)

$(tensor_objs): ..\include\tensor\config.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /c /Fo$@ $(srcdir)/src/$(@:.obj=.cc)

$(headers) $(includedir)\config.h: $(srcdir)\include\tensor
	-md ..\include\tensor
	-md $(directories)
	xcopy /y /s $(srcdir)\include\tensor ..\include\tensor
	copy config.h $(includedir)

..\lib\tensor.lib: $(tensor_objs) $(arpack_objs)
	lib /out:$@ $(tensor_objs) $(arpack_objs)

clean:
	-for %f in ($(TARGETS)) do if exist %f del %f
	-for %f in ($(directories) $(includedir)) do if exist %f rd /s /q %f
