#include<iostream.h>
#include<conio.h>
void main()
	{
	int i,total=0,n;
	clrscr();
	cout<<"Enter any number:-";
	cin>>n;
	for(i=1;i<=10;i++)
		{
		total=n*i;
		cout<<n<<"*"<<i<<"="<<total<<endl;
		}

	getch();
	}