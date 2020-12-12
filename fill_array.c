#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int number[2005];     

int main() 
{
    int i=0,n;
    n = 1500;
    for(int j=0;j<n;j++)   
		for(int k=0;k<n;k++)
			for(int l=0;l<n;l++) 					
				number[j] = number[j] + rand() % 10000;
    for(i=0;i<n-1;i++)    
        printf("%d ",number[i]);    
    printf("%d\n",number[i]);
    return 0;
}