#include<iostream.h>
#include<conio.h>
void main()
	{
	clrscr();
	int sum=0,i=1,j=1;
	while(i<=500)
		{
		while(j<=500)
			{
			if(j<i)
				{
				if(i%j==0)
				sum=sum+j;
				}
			j++;
			}
		if(sum==i)
			cout<<i<<"Parfect number"<<endl;
		i++;
		j=1,sum=0;
		}
	getch();
	}
