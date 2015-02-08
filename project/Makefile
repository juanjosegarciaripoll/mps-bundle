# Location of the script that builds programs
TENSOR_CONFIG=../bin/tensor-config

# List of files that make up our program
SOURCES=project.cc

# Name of the executable file
PROGRAM=./project.exe

$(PROGRAM):
	$(TENSOR_CONFIG) --link -o $(PROGRAM) $(SOURCES) -lmps

run: $(PROGRAM)
	$(PROGRAM)

clean:
	rm -rf $(PROGRAM) *.o *.dSYM
