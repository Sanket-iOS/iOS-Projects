#include<stdio.h>
#include<conio.h>
void main()
	{
	int i,j;
	clrscr();
	for(i=1;i<=5;i++)
		{
		for(j=1;j<=6-i;j++)
			{
			if(i%2==0)
				printf("0");
			else
				printf("1");
			}
		printf("\n");
		}
	getch();
	}
