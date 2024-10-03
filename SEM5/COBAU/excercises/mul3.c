#include "stdio.h"
#include <string.h>

int main(int argc, char *argv[])
{
	char* a;
	printf("Enter a number: ");
	scanf("%s", a);

	int len = strlen(a);

	int num = 0;
	for (int i = 0; i < len ; i++) {
		int digit = a[len - i - 1] - 48;
		int factor = 1;
		for (int j = 0; j < i; j++) {
			factor *= 10;
		}
		
		printf("digit: %d, factor: %d\n", digit, factor);
		num += digit * factor;
		printf("num: %d\n\n", num);
	}
}
