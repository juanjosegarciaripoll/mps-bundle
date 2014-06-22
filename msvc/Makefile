all: lib/mps.lib

lib/f2c.lib:
	cd f2c
	nmake
	cd ..
lib/cblapack.lib:
	cd cblapack
	nmake
	cd ..
lib/tensor.lib: lib/f2c.lib lib/cblapack.lib
	cd tensor
	nmake
	cd ..
lib/mps.lib: lib/tensor.lib
	cd mps
	nmake
	cd ..

clean:
	for %i in (f2c cblapack tensor mps) do (pwd && cd %i && nmake clean && cd .. && pwd)
