@echo off
set BATCHDIR=%~dp0
set TENSORDIR=%BATCHDIR%..
if "%1" == "--debug" goto debug
if "%1" == "--link" goto link
if "%1" == "--compile" goto compile
goto help

:missing2
echo Wrong usage:
echo  missing argument 1 after option
goto help

:missing3
echo Wrong usage:
echo  missing argument 2 after option
goto help

:help
echo Proper usage:
echo  tensor-config.bat --compile output-file input-file ...
echo  tensor-config.bat --link    output-file input-files ...
goto :out

:debug
set TENSORDBG="/Zi"
%0 %2 %3  %4 %5 %6 %7 %8 %9
set TENSORDBG=
goto out

:link
if "%2" == "" goto missing2
if "%3" == "" goto missing3
cl /nologo /EHsc %TENSORDBG% /I"%TENSORDIR%\include" /Fe"%2" %3 %4 %5 %6 %7 %8 %9 "%TENSORDIR%\lib\mps.lib" "%TENSORDIR%\lib\tensor.lib" "%TENSORDIR%\lib\lapack.lib" "%TENSORDIR%\lib\cblas.lib" "%TENSORDIR%\lib\blas.lib" "%TENSORDIR%\lib\f2c.lib" advapi32.lib
goto out

:compile
if "%2" == "" goto missing2
if "%3" == "" goto missing3
cl /nologo /EHsc %TENSORDBG%  /I"%TENSORDIR%\include" /Fo"%2" %3 %4 %5 %6 %7 %8 %9
goto out

:out
set BATCHDIR=
set TENSORDIR=
