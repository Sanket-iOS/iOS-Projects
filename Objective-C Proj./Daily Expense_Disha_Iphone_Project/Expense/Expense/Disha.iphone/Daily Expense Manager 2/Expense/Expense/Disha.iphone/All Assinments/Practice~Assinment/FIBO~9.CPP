#include<iostream.h>
#include<conio.h>
void main()
	{
	int a,b,n,c,i;
	clrscr();
	cout<<"Enter Range Number:-";
	cin>>n;
	a=0;
	b=1;
	cout<<a<<"\t"<<b;
	for(i=1;i<=n-2;i++)
		{
		c=a+b;
		cout<<"\t"<<c;
		a=b;
		b=c;
		}
	getch();
	}
