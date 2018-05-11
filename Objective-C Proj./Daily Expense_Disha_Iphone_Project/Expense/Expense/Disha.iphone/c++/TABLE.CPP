#include<iostream.h>
#include<conio.h>
void main()
	{
	int i,n,total=0;
	clrscr();
	cout<<"Enter Number";
	cin>>n;
	for(i=0;i<10;i++)
		{
		total=n*i;
		cout<<n<<"*"<<i<<"="<<total<<endl;
		}

	getch();
	}
