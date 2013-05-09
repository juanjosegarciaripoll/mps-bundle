PROGRAM=exp_0.exe

%.exe: %.cc common.cc
	$(CXX) -o $@ $< `tensor-config --cppflags` `tensor-config --cxxflags` -O2 -lmps `tensor-config --ldflags`

all: $(PROGRAM)

run: $(PROGRAM)
	$(PROGRAM)

clean:
	rm -rf *.exe *.dSYM
