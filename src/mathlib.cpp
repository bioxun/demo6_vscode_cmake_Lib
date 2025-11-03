
//#define BUILD_DLL
#include "mathlib.h"
#include <iostream>

int add(int a, int b) {
	int z=a + b;
	printf("[%d]----!---\n",z);
    return z;
}

int sub(int a, int b) {
    return a - b;
}
