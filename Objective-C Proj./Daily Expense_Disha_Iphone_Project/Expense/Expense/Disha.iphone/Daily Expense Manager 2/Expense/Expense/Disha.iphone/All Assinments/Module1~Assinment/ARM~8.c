#include<stdio.h>
#include<conio.h>
void main()
	{
	int a,n,s=0,n1;
	clrscr();
	printf("Enter Number:-");
	scanf("%d",&n);
	n1=n;
	while(n1!=0)
		{
		a=n1%10;
		s+=a*a*a;
		n1/=10;
		}
	if(s==n)
		printf("Armstrong");
	else
		printf("not Armstrong");

	getch();
	}