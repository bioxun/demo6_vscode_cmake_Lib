
:: :: :::::::::::::::::::::::::::::::::::::::::::::::::::
:: :: generate object file
:: g++ -m64 -c mathlib.cpp -DBUILD_DLL
:: :: 通过.o文件生成动态库(.dll文件)和导出库(.a文件)
:: g++ -m64 -shared -o mathlib.dll mathlib.o -Wl,--out-implib,libmathlib.a

:: 直接通过源文件生成动态库(.dll文件)和导出库(.a文件)
g++ -m64 -shared -o mathlib.dll mathlib.cpp -Wl,--out-implib=libmathlib1.a -DBUILD_DLL
:: g++ -m64 -shared -o mathlib.dll mathlib.cpp -DBUILD_DLL

:: :: generate exe file (链接libmathlib1.a)
g++ -m64 test.cpp -o test -L. -lmathlib1  

:: run exe file
test


:: generate exe file (链接mathlib.dll)
g++ -m64 test.cpp -o test2 mathlib.dll
:: g++ -m64 -o test mathlib.dll test.cpp
test2


:: 链接mathlib.dll
g++ -m64 test.cpp -o test1 -L. -lmathlib

test1

:: 
pause


:: g++ -m64 -c mathlib.cpp -DBUILD_DLL -o mathlib2.o
:: ar cs libmathlib2.a mathlib2.o
:: ar rcs libmathlib2.a mathlib2.o
:: ar rcs libmathlib.a mathlib.o
:: 
:: g++ -shared -o mathlib.dll mathlib.cpp -Wl,--out-implib=libmathlib.a
:: g++ -o test test.cpp mathlib.dll

:: g++ test_1.cpp -o test_1 -L. -lmathlib
