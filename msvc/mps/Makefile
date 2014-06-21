srcdir=..\..\mps
includedir=..\include\mps

CXX=cl
LINK=link
CPPFLAGS=/I. /I..\include
CXXFLAGS=/O2 /nologo /EHsc

include ..\..\mps\src\Makefile.am
include ..\..\mps\include\Makefile.am

mps_headers=$(nobase_include_HEADERS:mps/=$(includedir)\) \
	$(includedir)\config.h
mps_objects=$(libmps_la_SOURCES:.cc=.obj)
directories=iTEBD quantum hamiltonian tools evolve dmrg mps

TARGETS=..\lib\mps.lib

.SUFFIXES: .cc .obj

$(mps_objects): ..\include\mps\config.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) /c /Fo$@ $(srcdir)/src/$(@:.obj=.cc)

all: $(TARGETS)

$(mps_headers): $(srcdir)\include\mps
	-md ..\include\mps
	-md $(directories)
	xcopy /y /s $(srcdir)\include\mps ..\include\mps
	copy config.h $(includedir)

..\lib\mps.lib: $(mps_objects)
	$(LINK) -out:$@ $(mps_objects)

clean:
	-for %f in ($(TARGETS)) do if exist %f del %f
	-for %f in ($(directories) $(includedir)) do if exist %f rd /s /q %f
