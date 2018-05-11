#include<iostream.h>
#include<conio.h>
void main()
	{
	int i,d,b,j,k;
	clrscr();
	cout<<"Enter Decimal number";
	cin>>d;
	n=d;
	if(i=0;n!=0;i++)
		{
		n=n/2;
		}
	i=i-2;
	for(j=i;j>=0;j--)
	{
	k=d>>j;
	if(k & 1)
		cout<<"1";
	else
		cout<<"0";


	}
	getch();
	}
