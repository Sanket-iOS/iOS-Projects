#include<stdio.h>
#include<conio.h>
void main()
	{
	int a,b,n,c,i;
	clrscr();
	printf("Enter Range number:-");
	scanf("%d",&n);
	a=0;
	b=1;
	printf("%d\t%d",a,b);
	i=1;
	while(i<=n-2)
		{
		c=a+b;
		printf("\t%d",c);
		a=b;
		b=c;
		i++;
		}
	getch();
	}
for(i=1;i<=n-2;i++)
{
c=a+b;
a=b;
b=c;
}
