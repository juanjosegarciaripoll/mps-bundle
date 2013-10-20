PROGRAM=exp_0.exe

%.exe: %.cc common.cc
	../bin/tensor-config --link -o $@ $< -O2 -lmps

all: $(PROGRAM)

run: $(PROGRAM)
	$(PROGRAM)

clean:
	rm -rf *.exe *.dSYM
