#include<iostream.h>
#include<conio.h>
void main()
	{
	int a,n,s=0,n1;
	clrscr();
	cout<<"Enter Number:-";
	cin>>n;
	n1=n;
	while(n1!=0)
		{
		a=n1%10;
		s+=a*a*a;
		n1/=10;
		}
	if(s==n)
		cout<<"Armstrong";
	else
		cout<<"not Armstrong";

	getch();
	}