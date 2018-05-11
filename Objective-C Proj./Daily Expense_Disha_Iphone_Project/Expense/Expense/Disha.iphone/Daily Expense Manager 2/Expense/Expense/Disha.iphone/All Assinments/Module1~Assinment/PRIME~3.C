#include<stdio.h>
#include<conio.h>
void main()
	{
	int i,f=0,n;
	clrscr();
	printf("Enter number:-");
	scanf("%d",&n);
	for(i=1;i<=n;i++)
		{
		for(j=2;j<=n/2;j++)
			{
			if(j%i==0)
				f++;
			}
		}
	if(f==2 & n!=0)
		{
		printf("%d",i);
		}

	getch();
	}
