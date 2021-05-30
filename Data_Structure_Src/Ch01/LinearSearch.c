#include <stdio.h>

int LSearch(int ar[], int len, int target)
{
	int i;
	for(i=0; i<len; i++)
	{
		if(ar[i]==target)
			return i;    // 李얠