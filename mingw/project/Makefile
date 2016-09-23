
# Location of the script that builds programs
TENSOR_CONFIG=..\bin\tensor-config.bat

# List of files that make up our program
SOURCES=project.cc

# Name of the executable file
PROGRAM=project.exe

$(PROGRAM):
	$(TENSOR_CONFIG) --link $(PROGRAM) $(SOURCES)

run: $(PROGRAM)
	$(PROGRAM)

clean:
	for %i in (*.exe *.obj) do del %i
