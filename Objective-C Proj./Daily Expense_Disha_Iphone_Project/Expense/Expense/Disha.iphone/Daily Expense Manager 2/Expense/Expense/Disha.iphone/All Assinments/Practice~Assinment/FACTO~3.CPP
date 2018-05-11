#include<iostream.h>
#include<conio.h>
void main()
	{
	int f=1,i,n;
	clrscr();
	cout<<"Enter Any Number:-";
	cin>>n;
	for(i=1;i<=n;i++)
		{
		f=f*i;
		}
	cout<<"Factorial is"<<f;
	getch();
	}
