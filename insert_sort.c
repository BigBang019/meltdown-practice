#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 700000


int number[N+5];     
void insertion_sort(int *number,int n)   
{
    int i=0,ii=0,temp=0;  
    for(i=1;i<n;i++)  
    {
        temp=number[i];  
        ii=i-1;  
        while(ii>=0&&temp<number[ii])   
        {
            number[ii+1]=number[ii];   
            ii--; 
        }
        number[ii+1]=temp;   
    }              
}
int main() 
{
    int i=0,n;
    n = N;
    for(int j=0;j<n;j++)       //将所有数全放入number数组中 
        // scanf("%d",&number[j]) ;
        number[j] = rand() % 10000000;
    insertion_sort(number,n);   
    for(i=0;i<n-1;i++)    
        printf("%d ",number[i]);    
    printf("%d\n",number[i]);
    return 0;
}