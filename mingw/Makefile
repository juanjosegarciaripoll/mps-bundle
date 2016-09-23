include Makefile.flags

all: lib/mps.lib

lib/f2c.lib:
	cd f2c
	nmake DEBUG=$(DEBUG)
	cd ..
lib/cblapack.lib:
	cd cblapack
	nmake DEBUG=$(DEBUG)
	cd ..
lib/tensor.lib: lib/f2c.lib lib/cblapack.lib
	cd tensor
	nmake DEBUG=$(DEBUG)
	cd ..
lib/mps.lib: lib/tensor.lib
	cd mps
	nmake DEBUG=$(DEBUG)
	cd ..

download:
	cd .. && for %%i in (f2c tensor mps) do git clone https://github.com/juanjosegarciaripoll/%%i.git

update:
	for %%i in (f2c tensor mps) do (cd ../%%i && git pull)

clean:
	cd f2c
	nmake /nologo clean DEBUG=$(DEBUG)
	cd ../cblapack
	nmake /nologo clean DEBUG=$(DEBUG)
	cd ../tensor
	nmake /nologo clean DEBUG=$(DEBUG)
	cd ../mps
	nmake /nologo clean DEBUG=$(DEBUG)
