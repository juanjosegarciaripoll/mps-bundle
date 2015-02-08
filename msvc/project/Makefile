
# Location of the script that builds programs
TENSOR_CONFIG=..\bin\tensor-config.bat

# List of files that make up our program
SOURCES=project.cc

# Name of the executable file
EXE=project.exe

all:
	$(TENSOR_CONFIG) --link $(EXE) $(SOURCES)

clean:
	for %i in (*.exe *.obj) do del %i
