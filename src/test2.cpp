
#include <iostream>
#include "mathlib.h"

int main() {
	int a=33, b=55;
	int n=add(a, b);
	printf("%d+%d=%d\n",a,b,n);
	printf("%d-%d=%d\n",a,b,sub(a, b));
	return 0;
}
